package has.Task;

import has.Employee.Employee;
import has.Employee.EmployeeDTO;
import has.Employee.EmployeeService;
import has.Room.RoomService;
import has.Utils.TaskHandler;
import org.joda.time.LocalTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Chokleet on 25.2.2017 г..
 */
@Service
public class TaskService {

    private static final int UNRESOLVED = 2;

    @Autowired
    private TaskRepository repo;

    @Autowired
    private RoomService roomService;

    @Autowired
    private TaskHandler taskHandler;

    @Autowired
    private EmployeeService employeeService;

    public Task save(Task task, String assigner) {
        task.setAssigner(assigner);
        task = validateTargetTime(task);
        return repo.save(task);
    }

    public Task save(Task task) throws Exception {
        task = validateTargetTime(task);
        task = repo.save(taskHandler.assignTask(task, taskHandler.findShift(new LocalTime())));
        organizeTasks(task.getAssignee().getId());
        return task;
    }

    public List<Task> equalize() throws Exception {
        List<EmployeeDTO> employees = taskHandler.findEmployeesOnShiftDTO(new LocalTime(), false);
        List<Task> tasks = repo.save(taskHandler.equalizeTasks(employees));
        organize(employees);
        return tasks;
    }

    public List<Task> getAllTasks() {
        return repo.findAll();
    }

    public Task findById(Long id) throws Exception {
        Task Task = repo.findOne(id);
        validateIdNotNull(Task);
        return Task;
    }

    public Task remove(Long id) throws Exception {
        Task Task = repo.findOne(id);
        validateIdNotNull(Task);
        repo.delete(Task);
        return Task;
    }

    public Task update(Long id, Task task) throws Exception {
        Task dbTask = repo.findOne(id);
        validateIdNotNull(dbTask);
        dbTask.setTitle(task.getTitle());
        dbTask.setDescription(task.getDescription());
        dbTask.setPriority(task.getPriority());
        dbTask.setStartTime(task.getStartTime());
        dbTask.setFinishTime(task.getFinishTime());
        dbTask.setTimePlaced(task.getTimePlaced());
        dbTask.setStatus(task.getStatus());
        dbTask.setAssigner(task.getAssigner());
        dbTask.setAssignee(task.getAssignee());
        dbTask.setDuration(task.getDuration());
        dbTask = repo.save(dbTask);
        organizeTasks(dbTask.getAssignee().getId());
        return dbTask;
    }

    public List<Task> getEmployeesTasks(Employee employee) {
        return repo.findByAssigneeId(employee.getId());
    }

    public List<Task> getEmployeesUnresolvedTasks(Employee employee) {
        return repo.findByAssigneeIdAndStatusNotOrderByTimePlaced(employee.getId(), UNRESOLVED);
    }

    public Page<Task> searchCurrentShift(int start, int length, String sortColumn, String sortDirection, String assignee) {
        PageRequest request = new PageRequest((start / length), length, Sort.Direction.fromString(sortDirection), sortColumn);
        return repo.findByStatusLessThanAndAssigneePersonalDataFullNameContainingIgnoreCase(3, assignee, request);
    }

    public Task changeStatus(Long id, Integer status) throws Exception {
        Task task = repo.findOne(id);
        task.setStatus(status);
        if (status == 1) {
            task.setStartTime(new LocalTime().toString());
        } else if (status == 2) {
            if (task.getRequest() != null && task.getRequest().getType() == 10) {
                roomService.clearRoomByNumber(Integer.parseInt(
                        task.getDescription().substring(task.getDescription().length() - 3)));
            }
            task.setFinishTime(new LocalTime().toString());
            organizeTasks(task.getAssignee().getId());
        }
        return repo.save(task);
    }

    private void validateIdNotNull(Task task) throws Exception {
        if (task == null) {
            throw new Exception("There is no task with such ID");
        }
    }

    private Task validateTargetTime(Task task) {
        if (task.getTargetTime() != null) {
            task.setStartTime(task.getTargetTime());
        }
        return task;
    }

    public List<Task> organizeTasks(Long employeeId) throws Exception {
        EmployeeDTO employeeDTO = employeeService.transferEmployeeToDTO(employeeId, false);
        return repo.save(taskHandler.organizeTasks(employeeDTO));
    }

    private void organize(List<EmployeeDTO> employees) throws Exception {
        for (EmployeeDTO employeeDTO : employees) {
            organizeTasks(employeeDTO.getWorkingSchedule().getEmployee().getId());
        }
    }
}
