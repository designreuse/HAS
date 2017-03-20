package has.ReservationGuest;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by kaloi on 1/31/2017.
 */
@Repository
public interface ReservationGuestRepository extends JpaRepository<ReservationGuest, Long> {

    ReservationGuest findByReservationStatusAndGuestId(Integer status, Long guestId);
}
