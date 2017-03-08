package has.Request;

import has.Reservation.Reservation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by kaloi on 12/20/2016.
 */
@Service
public class RequestService {

    @Autowired
    private RequestRepository repo;

    public Request save(Request request) {
        return repo.save(request);
    }

    public List<Request> getAllRequests() {
        List<Request> requests = repo.findAll();
        for (Request request : requests) {
            request = removeRecursions(request);
        }

        return requests;
    }

    public Request findById(Long id) throws Exception {
        Request request = repo.findOne(id);
        validateIdNotNull(request);
        return request;
    }

    public Request remove(Long id) throws Exception {
        Request request = repo.findOne(id);
        validateIdNotNull(request);
        repo.delete(request);
        return request;
    }

    public Request update(Long id, Request request) throws Exception {
        Request dbRequest = repo.findOne(id);
        validateIdNotNull(dbRequest);

        dbRequest.setStatus(request.getStatus());
        dbRequest.setTimeFinished(request.getTimeFinished());
        dbRequest.setTimePlaced(request.getTimePlaced());
        dbRequest.setType(request.getType());

        return repo.save(dbRequest);
    }

    private Request removeRecursions(Request request) {
        Reservation reservation = request.getReservationGuest().getReservation();

        reservation.setReservationGuests(null);
        reservation.getReceptionist().setWorkingSchedules(null);

        request.getReservationGuest().setReservation(reservation);
        request.getEmployee().setWorkingSchedules(null);

        //for (RequestMeal rm : request.getRequestMeals()) {
        //    rm.setRequest(null);
        //}

        return request;
    }

    private void validateIdNotNull(Request request) throws Exception {
        if (request == null) {
            throw new Exception("There is no request with such ID");
        }
    }
}
