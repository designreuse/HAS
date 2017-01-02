package has.User;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import has.Employee.Employee;
import has.Guest.Guest;
import lombok.Getter;
import lombok.Setter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * Created by kaloi on 12/17/2016.
 */
@Getter
@Setter
@Entity
public class User implements Serializable, UserDetails {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String lastLogin;
    private String password;
    private String email;
    private String regDate;
    private String username;

    @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private UserRole userRole;

    @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL, mappedBy = "user")
    private Employee employee;

    @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL, mappedBy = "user")
    private Guest guest;

    public User() {

    }

    public User(String lastLogin, String password, String regDate, String username, Employee employee) {
        this.lastLogin = lastLogin;
        this.password = password;
        this.regDate = regDate;
        this.username = username;
        this.employee = employee;
    }

    public User(String lastLogin, String password, String regDate, String username, Employee employee, UserRole userRole) {
        this.lastLogin = lastLogin;
        this.password = password;
        this.regDate = regDate;
        this.username = username;
        this.employee = employee;
        this.userRole = userRole;
    }

    public User(String lastLogin, String password, String regDate, String username) {
        this.lastLogin = lastLogin;
        this.password = password;
        this.regDate = regDate;
        this.username = username;
    }

    public User(String lastLogin, String password, String email, String regDate, String username, Employee employee, Guest guest) {
        this.lastLogin = lastLogin;
        this.password = password;
        this.email = email;
        this.regDate = regDate;
        this.username = username;
        this.employee = employee;
        this.guest = guest;
    }

    @Override
    @JsonIgnore
    public Collection<? extends GrantedAuthority> getAuthorities() {
        List<GrantedAuthority> authList = new ArrayList<>();
        authList.addAll((Collection<? extends GrantedAuthority>) userRole.getPermissions());
        return authList;
    }

    @Override
    @JsonIgnore
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    @JsonIgnore
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    @JsonIgnore
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    @JsonIgnore
    public boolean isEnabled() {
        return true;
    }

    @JsonIgnore
    public UserRole getUserRole() {
        return userRole;
    }

    @JsonIgnore
    public Employee getEmployee() {
        return employee;
    }

    @JsonIgnore
    public Guest getGuest() {
        return guest;
    }

    @JsonProperty
    public void setUserRole(UserRole userRole) {
        this.userRole = userRole;
    }

    @JsonProperty
    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    @JsonProperty
    public void setGuest(Guest guest) {
        this.guest = guest;
    }
}
