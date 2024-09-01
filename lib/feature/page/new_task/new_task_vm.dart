import 'package:injectable/injectable.dart';
import 'package:listfull/core/base/base_view_model.dart';
import 'package:listfull/feature/data/model/enums/priority_enums.dart';
import 'package:listfull/feature/data/model/task.dart';
import 'package:listfull/feature/data/repository/task_repository.dart';

@injectable
class NewTaskViewModel extends BaseViewModel {
  final TaskRepository _taskRepository;

  NewTaskViewModel(this._taskRepository);

  PriorityEnums _selectedPriority = PriorityEnums.low;
  PriorityEnums get selectedPriority => _selectedPriority;
  void setselectedPriority(PriorityEnums selectedPriority) {
    _selectedPriority = selectedPriority;
    notifyListeners();
  }

  DateTime _taskDate = DateTime.now();
  DateTime get taskDate => _taskDate;
  void settaskDate(DateTime taskDate) {
    _taskDate = taskDate;
    notifyListeners();
  }

  int _pomodoroTime = 25;
  int get pomodoroTime => _pomodoroTime;
  void setpomodoroTime(int pomodoroTime) {
    _pomodoroTime = pomodoroTime;
    notifyListeners();
  }

  int _pomodoroCount = 1;
  int get pomodoroCount => _pomodoroCount;
  void setpomodoroCount(int pomodoroCount) {
    _pomodoroCount = pomodoroCount;
    notifyListeners();
  }

  void increasePomodoro() {
    if (_pomodoroCount < 10) _pomodoroCount++;
    notifyListeners();
  }

  void decreasePomodoro() {
    if (_pomodoroCount > 1) {
      _pomodoroCount--;
      notifyListeners();
    }
  }

  Future<void> saveTask(Task task) async {
    await _taskRepository.saveTask(task, DateTime.now());
  }

  bool checkTaskValid(Task task) {
    if (task.title.length < 3 ||
        task.title.length > 50 ||
        task.description.length < 3 ||
        task.description.length > 100 ||
        task.timePiece.isEmpty ||
        task.timePiece.length > 10) {
      return false;
    } else {
      return true;
    }
  }
}
