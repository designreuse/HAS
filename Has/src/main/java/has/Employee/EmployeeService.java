package has.Employee;

import has.Utils.Validator;
import has.WorkingSchedule.WorkingSchedule;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by kaloi on 12/19/2016.
 */
@Service
public class EmployeeService {

    @Autowired
    private EmployeeRepository repo;

    public Employee save(Employee employee) throws Exception {
        validateEgn(employee);
        validateIssueDate(employee);

        return repo.save(employee);
    }

    public List<Employee> getAllEmployedEmployees() {
        List<Employee> employees = repo.findByEmployedTrue();

        for (Employee emp : employees) {
            for (WorkingSchedule schedule : emp.getWorkingSchedules()) {
                schedule.setEmployee(null);
            }
        }
        return employees;
    }

    public List<Employee> getAllEmployees() {
        List<Employee> employees = repo.findAll();

        for (Employee emp : employees) {
            for (WorkingSchedule schedule : emp.getWorkingSchedules()) {
                schedule.setEmployee(null);
            }
        }
        return employees;
    }

    public Page<Employee> searchEmployees(int start, int length, String sortColumn, String sortDirection, String fullName, String phone, String dateHired, boolean employed) {
        PageRequest request = new PageRequest((start / length), length, Sort.Direction.fromString(sortDirection), sortColumn);
        Page<Employee> employeesPage;
        if (dateHired.isEmpty()) {
            employeesPage = repo.findByPersonalDataFullNameContainingIgnoreCaseAndPersonalDataPhoneContainingAndEmployed(fullName, phone, request, employed);
        } else {
            employeesPage = repo.findByPersonalDataFullNameContainingIgnoreCaseAndPersonalDataPhoneContainingAndDateHiredAndEmployed(fullName, phone, dateHired, request, employed);
        }

        for (Employee emp : employeesPage)
            for (WorkingSchedule schedule : emp.getWorkingSchedules())
                schedule.setEmployee(null);

        return employeesPage;
    }

    public Employee findById(Long id) throws Exception {
        Employee employee = repo.findOne(id);
        validateIdNotNull(employee);

        for (WorkingSchedule schedule : employee.getWorkingSchedules()) {
            schedule.setEmployee(null);
        }
        return employee;
    }

    public Employee findByUserId(Long userId) throws Exception {
        Employee employee = repo.findByUserId(userId);

        for (WorkingSchedule schedule : employee.getWorkingSchedules()) {
            schedule.setEmployee(null);
        }
        return employee;
    }

    public Employee remove(Long id) throws Exception {
        Employee employee = repo.findOne(id);
        validateIdNotNull(employee);
        repo.delete(employee);
        return employee;
    }

    public Employee update(Long id, Employee employee) throws Exception {
        Employee dbEmployee = repo.findOne(id);
        validateIdNotNull(dbEmployee);
        validateIssueDate(employee);
        validateEgn(employee);

        dbEmployee.setDateHired(employee.getDateHired());
        dbEmployee.setPersonalData(employee.getPersonalData());
        if (dbEmployee.getUser().getId() != employee.getUser().getId()) {
            dbEmployee.setUser(employee.getUser());
        }
        return repo.save(dbEmployee);
    }

    public Employee changeEmployment(Long id) throws Exception {
        Employee employee = repo.findOne(id);
        validateIdNotNull(employee);

        if (employee.isEmployed() == true) {
            employee.setEmployed(false);
        } else {
            employee.setEmployed(true);
        }
        return repo.save(employee);
    }

    private void validateIssueDate(Employee employee) throws Exception {
        if (!Validator.isValidIssueDate(employee.getPersonalData().getIdentityIssueDate(), employee.getPersonalData().getIdentityExpireDate())) {
            throw new Exception("Invalid issue date");
        }
    }

    private void validateEgn(Employee employee) throws Exception {
        Employee dbEmployee2 = repo.findByPersonalDataEgn(employee.getPersonalData().getEgn());
        if (dbEmployee2 != null && dbEmployee2.getId() != employee.getId()) {
            throw new Exception("Employee with EGN " + employee.getPersonalData().getEgn() + " already exists.");
        }
    }

    private void validateIdNotNull(Employee employee) throws Exception {
        if (employee == null) {
            throw new Exception("There is no employee with such ID");
        }
    }
}
