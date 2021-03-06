package has.Reservation;

import freemarker.template.TemplateException;
import has.Room.Room;
import has.User.User;
import has.Utils.BookingSearchRequest;
import has.Utils.DataTableResult;
import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import javax.websocket.server.PathParam;
import java.io.IOException;
import java.net.URISyntaxException;
import java.util.List;
import java.util.Map;

/**
 * Created by kaloi on 12/20/2016.
 */
@RestController
public class ReservationController {

    @Autowired
    private ReservationService reservationService;

    @RequestMapping(value = "/reservation", method = RequestMethod.POST,
            produces = MediaType.APPLICATION_JSON_VALUE,
            consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(value = HttpStatus.OK)
    @PreAuthorize("hasAuthority('PERM_CREATE_RESERVATION')")
    public Reservation save(@RequestBody Reservation reservation,
                            @AuthenticationPrincipal @Valid User user,
                            @RequestParam(value = "recepcionistUserId", required = false) Long recepcionistUserId,
                            @RequestParam("group") boolean isGroup,
                            @RequestParam(value = "groupId", required = false) String groupId) throws IOException, TemplateException, URISyntaxException {
        return reservationService.save(reservation, isGroup, groupId, recepcionistUserId, user);
    }

    @RequestMapping(value = "/reservations", method = RequestMethod.POST,
            produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(value = HttpStatus.OK)
    @PreAuthorize("hasAuthority('PERM_VIEW_RESERVATION')")
    public List<Reservation> getAllReservations() {
        return reservationService.getAllReservations();
    }

    @RequestMapping(value = "/reservations/search", method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(value = HttpStatus.OK)
    @PreAuthorize("hasAuthority('PERM_VIEW_RESERVATION')")
    public
    @ResponseBody
    List<Reservation> search(
            @RequestParam("startDate") String startDate,
            @RequestParam("endDate") String endDate,
            @RequestParam(value = "group", required = false) Boolean isGroup) {
        return reservationService.searchReservations(startDate, endDate, isGroup);
    }

    @RequestMapping(value = "/reservations/booking", method = RequestMethod.POST,
            produces = MediaType.APPLICATION_JSON_VALUE,
            consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(value = HttpStatus.OK)
    //@PreAuthorize("hasAuthority('PERM_VIEW_RESERVATION')")
    public
    @ResponseBody
    List<Room> bookingSearch(
            @RequestParam(name = "existingId", required = false) Long existingId,
            @RequestBody BookingSearchRequest request) {

        return reservationService.searchReservationsWeb(
                request.getStartDate(),
                request.getEndDate(),
                request.getNumberAdults(),
                (request.getNumberChildren() > 0),
                request.isPets(),
                request.isMinibar(),
                existingId
        );
    }

    @RequestMapping(value = "/reservation/{id}", method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(value = HttpStatus.OK)
    @PreAuthorize("hasAuthority('PERM_VIEW_RESERVATION')")
    public Reservation findReservationById(@PathVariable Long id) throws Exception {
        return reservationService.findById(id);
    }

    @RequestMapping(value = "/reservation/code/{code}", method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(value = HttpStatus.OK)
    //@PreAuthorize("hasAuthority('PERM_VIEW_RESERVATION')")
    public Reservation findReservationById(@PathVariable String code) throws Exception {
        return reservationService.findByCode(code);
    }

    @RequestMapping(value = "/reservation/group", method = RequestMethod.PUT,
            produces = MediaType.APPLICATION_JSON_VALUE,
            consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(value = HttpStatus.OK)
    //@PreAuthorize("hasAuthority('PERM_VIEW_RESERVATION')")
    public List<Reservation> updateGroupReservations(
            @RequestBody @Valid Reservation reservation,
            @RequestParam(value = "rooms", required = false) String roomIds) throws Exception {
        List<Reservation> updated = reservationService.updateGroupReservationDetails(reservation, roomIds);

        //just a temporal fix for a weird shit, it's just for the json
        for (Reservation r : updated)
            r.setRoom(null);

        return updated;
    }

    @RequestMapping(value = "/reservation/{id}", method = RequestMethod.DELETE,
            produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(value = HttpStatus.OK)
    @PreAuthorize("hasAuthority('PERM_REMOVE_RESERVATION')")
    public Reservation removeReservationById(@PathVariable Long id) throws Exception {
        return reservationService.remove(id);
    }

    @RequestMapping(value = "/reservation/{id}", method = RequestMethod.PUT,
            produces = MediaType.APPLICATION_JSON_VALUE,
            consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(value = HttpStatus.OK)
    @PreAuthorize("hasAuthority('PERM_EDIT_RESERVATION')")
    public Reservation updateReservation(@PathVariable Long id, @RequestBody @Valid Reservation reservation, @AuthenticationPrincipal User user) throws Exception {
        return reservationService.update(id, reservation, user);
    }

    @RequestMapping(value = "/reservation/move/{id}", method = RequestMethod.PUT,
            produces = MediaType.APPLICATION_JSON_VALUE,
            consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(value = HttpStatus.OK)
    @PreAuthorize("hasAuthority('PERM_EDIT_RESERVATION')")
    public Reservation moveReservation(@PathVariable Long id, @RequestBody Reservation reservation, @AuthenticationPrincipal User user) throws Exception {
        return reservationService.move(id, reservation, user);
    }

    @RequestMapping(value = "/reservation/close/{id}", method = RequestMethod.PUT,
            produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(value = HttpStatus.OK)
    @PreAuthorize("hasAuthority('PERM_EDIT_RESERVATION')")
    public Reservation closeReservation(@PathVariable Long id, @AuthenticationPrincipal User user) throws Exception {
        return reservationService.close(id, user);
    }

    @RequestMapping(value = "/reservation/checkin/{id}", method = RequestMethod.PUT,
            produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(value = HttpStatus.OK)
    @PreAuthorize("hasAuthority('PERM_EDIT_RESERVATION')")
    public Reservation checkInReservation(@PathVariable Long id, @AuthenticationPrincipal User user) throws Exception {
        return reservationService.checkIn(id, user);
    }

    @RequestMapping(value = "/reservations/guest/{id}", method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(value = HttpStatus.OK)
    @PreAuthorize("hasAuthority('PERM_VIEW_RESERVATION_GUEST')")
    public DataTableResult getGuestHistory(@PathVariable Long id, HttpServletRequest request) {
        Map<String, String[]> parameterMap = request.getParameterMap();

        char sortColumnNumber = parameterMap.get("order[0][column]")[0].charAt(0);
        String sortColumnParam = "columns[" + sortColumnNumber + "][data]";

        Page<Reservation> guests = reservationService.getClientHistory(
                id,
                Integer.parseInt(parameterMap.get("start")[0]),
                Integer.parseInt(parameterMap.get("length")[0]),
                parameterMap.get(sortColumnParam)[0],
                parameterMap.get("order[0][dir]")[0]
        );

        return new DataTableResult(
                Integer.parseInt(parameterMap.get("draw")[0]),
                Integer.parseInt(parameterMap.get("start")[0]),
                Integer.parseInt(parameterMap.get("length")[0]),
                guests.getTotalElements(),
                guests.getTotalElements(),
                guests.getContent());
    }

    @RequestMapping(value = "/reservation/guest", method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(value = HttpStatus.OK)
    @PreAuthorize("hasAuthority('PERM_VIEW_RESERVATION')")
    public List<Reservation> findReservationByGuestFullName(@PathParam("fullName") String fullName) throws Exception {
        return reservationService.findByGuestFullName(fullName);
    }
}
