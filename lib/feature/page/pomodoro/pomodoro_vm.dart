import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:listfull/core/base/base_view_model.dart';
import 'package:listfull/feature/data/model/enums/priority_enums.dart';
import 'package:listfull/feature/data/model/task.dart';
import 'package:listfull/feature/data/repository/task_repository.dart';

@injectable
class PomodoroViewModel extends BaseViewModel {
  final TaskRepository _taskRepository;

  PomodoroViewModel(this._taskRepository);

  bool _isEditing = false;
  bool get isEditing => _isEditing;
  void setisEditing() {
    _isEditing = !_isEditing;
    notifyListeners();
  }

  void completePomodoro(int index) {
    task.timePiece[index].completed = !task.timePiece[index].completed;
    _taskRepository.saveTask(task, DateTime.now());
    notifyListeners();
  }

  late PriorityEnums _prioritySelected;
  PriorityEnums get prioritySelected => _prioritySelected;
  void setprioritySelected(PriorityEnums prioritySelected) {
    _prioritySelected = prioritySelected;
    notifyListeners();
  }

  late Task _task;
  Task get task => _task;
  void settask(Task task) {
    _task = task;
    setminuteLeft(task.timePiece.first.minutes);
    setsecondLeft(0);
    notifyListeners();
  }

  late int _minuteLeft;
  int get minuteLeft => _minuteLeft;
  void setminuteLeft(int minuteLeft) {
    _minuteLeft = minuteLeft;
    notifyListeners();
  }

  late int _secondLeft;
  int get secondLeft => _secondLeft;
  void setsecondLeft(int secondLeft) {
    _secondLeft = secondLeft;
    notifyListeners();
  }

  Timer? _timer;
  bool _isRunning = false;
  bool get isRunning => _isRunning;

  void startTimer() {
    //TODO Alert will be added
    if (_isRunning) return;

    _isRunning = true;
    notifyListeners();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondLeft > 0) {
        setsecondLeft(_secondLeft - 1);
      } else {
        if (_minuteLeft > 0) {
          setminuteLeft(_minuteLeft - 1);
          setsecondLeft(59);
        } else {
          stopTimer();
          completePomodoro(task.timePiece.indexOf(
              task.timePiece.firstWhere((element) => !element.completed)));
        }
      }
    });
  }

  void pauseTimer() {
    _timer?.cancel();
    _isRunning = false;
    notifyListeners();
  }

  void stopTimer() {
    _timer?.cancel();
    _isRunning = false;
    setminuteLeft(task.timePiece.first.minutes);
    setsecondLeft(0);
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }



  Future<void> deleteTask(Task task) async {
    await _taskRepository.deleteTask(task, DateTime.now());
    notifyListeners();
  }
}
