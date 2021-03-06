package has.Utils;

import has.Configuration.PropertiesReader;
import has.RequestMeal.RequestMeal;
import has.Reservation.Reservation;
import org.joda.time.Days;
import org.joda.time.LocalDate;

import java.io.IOException;
import java.net.URISyntaxException;
import java.util.List;


public class CalculationUtils {

    private CalculationUtils() {

    }

    public static Double getRequestsCost(List<RequestMeal> requestMealList) {
        Double sum = 0d;
        for (RequestMeal requestMeal : requestMealList) {
            sum += requestMeal.getMeal().getPrice() * requestMeal.getQuantity();
        }

        return sum;
    }

    public static Double getReservationCost(Reservation reservation) throws IOException, URISyntaxException {

        PropertiesReader reader = new PropertiesReader();
        double overnightPrice = reader.readDouble("overnightPrice");
        double singleBedPrice = reader.readDouble("singleBedPrice");
        double doubleBedPrice = reader.readDouble("doubleBedPrice");
        double allInclusivePrice = reader.readDouble("allInclusivePrice");
        double breakfastPrice = reader.readDouble("breakfastPrice");
        double dinnerPrice = reader.readDouble("dinnerPrice");
        double seasonalDiscount = reader.readDouble("seasonalDiscount");
        double lowClassPrice = reader.readDouble("lowClassPrice");
        double mediumClassPrice = reader.readDouble("mediumClassPrice");
        double highClassPrice = reader.readDouble("highClassPrice");

        int roomClass = reservation.getRoom().getRoomClass();
        double roomClassPrice =
                roomClass == 0 ? lowClassPrice
                        : roomClass == 1 ? mediumClassPrice
                        : roomClass == 2 ? highClassPrice
                        : 0;
        int guestRank = 0;
        if (reservation.getReservationGuests() != null && reservation.getReservationGuests().size() > 0) {
            guestRank = reservation.getReservationGuests().get(0).getGuest().getNumberReservations();
        }

        double guestDiscount =
                guestRank >= 10 && guestRank < 20 ? 0.05
                        : guestRank >= 20 && guestRank < 30 ? 0.1
                        : guestRank >= 30 && guestRank < 40 ? 0.15
                        : guestRank >= 40 ? 0.2
                        : 0;

        double totalDiscount = reader.readDouble("maxDiscount");
        if (seasonalDiscount + guestDiscount <= totalDiscount) {
            totalDiscount = seasonalDiscount + guestDiscount;
        }

        int allInclusiveValue = 0;
        int dinnerValue = 0;
        int breakfastValue = 0;

        if (reservation.isAllInclusive()) {
            allInclusiveValue = 1;
        } else {
            if (reservation.isDinner()) {
                dinnerValue = 1;
            }
            if (reservation.isBreakfast()) {
                breakfastValue = 1;
            }
        }

        double totalPrice = getReservationDuration(reservation) * (overnightPrice *
                (reservation.getRoom().getBedsSingle() * singleBedPrice +
                        reservation.getRoom().getBedsDouble() * doubleBedPrice) *
                roomClassPrice + allInclusiveValue * allInclusivePrice +
                dinnerValue * dinnerPrice + breakfastValue * breakfastPrice);

        return totalPrice - (totalPrice * totalDiscount);
    }

    public static int getReservationDuration(Reservation reservation) {
        LocalDate startDate = LocalDate.parse(reservation.getStartDate());
        LocalDate endDate = LocalDate.parse(reservation.getEndDate());
        int duration = Days.daysBetween(startDate, endDate).getDays();
        if (duration == 0) {
            duration = 1;
        }
        return duration;
    }
}
