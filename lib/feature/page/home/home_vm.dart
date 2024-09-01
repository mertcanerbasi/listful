import 'package:listfull/core/base/base_view_model.dart';
import 'package:injectable/injectable.dart';
import 'package:listfull/feature/data/model/enums/category_enums.dart';
import 'package:listfull/feature/data/model/task.dart';
import 'package:listfull/feature/data/repository/task_repository.dart';

@injectable
class HomeViewModel extends BaseViewModel {
  final TaskRepository _taskRepository;

  HomeViewModel(this._taskRepository);

  Future<void> clear() async {
    return await _taskRepository.clear();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void setisLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  int _completedTasks = 0;
  int get completedTasks => _completedTasks;
  void setcompletedTasks(int completedTasks) {
    _completedTasks = completedTasks;
    notifyListeners();
  }

  int _taskCount = 0;
  int get taskCount => _taskCount;
  void settaskCount(int taskCount) {
    _taskCount = taskCount;
    notifyListeners();
  }

  List<TaskList?>? _last7daysTasks;
  List<TaskList?>? get last7daysTasks => _last7daysTasks;
  void setlast7daysTasks(List<TaskList?>? last7daysTasks) {
    _last7daysTasks = last7daysTasks;
    notifyListeners();
  }

  int get last7daysTaskCount {
    if (_last7daysTasks == null) return 0;
    return _last7daysTasks!.fold(
      0,
      (previousValue, element) => previousValue + (element?.tasks?.length ?? 0),
    );
  }

  int get last7daysCompletedTasks {
    if (_last7daysTasks == null) return 0;
    return _last7daysTasks!.fold(
      0,
      (previousValue, element) =>
          previousValue +
          (element?.tasks?.where((task) => task.completed).length ?? 0),
    );
  }

  //Completed Tasks Count for a given date
  int getCompletedTasksCount(DateTime date) {
    var taskList = _taskRepository.getTaskList(date);
    if (taskList == null || taskList.tasks == null) return 0;
    return taskList.tasks!.where((element) => element.completed).length;
  }

  //Task Count for a given date
  int getTaskCount(DateTime date) {
    var taskList = _taskRepository.getTaskList(date);
    if (taskList == null || taskList.tasks == null) return 0;
    return taskList.tasks!.length;
  }

  List<TaskList?>? getTaskListForLast7Days() {
    var taskList = _taskRepository.getTaskListForLast7Days(DateTime.now());
    setlast7daysTasks(taskList);
    return taskList;
  }

  CategoryEnums _selectedCategory = CategoryEnums.overview;
  CategoryEnums get selectedCategory => _selectedCategory;
  void setselectedCategory(CategoryEnums selectedCategory) {
    _selectedCategory = selectedCategory;
    notifyListeners();
  }

  DateTime _currentDate = DateTime.now();
  DateTime get currentDate => _currentDate;
  void setcurrentDate(DateTime currentDate) {
    _currentDate = currentDate;
    notifyListeners();
  }

  //TaskList
  TaskList? _taskList;
  TaskList? get taskList => _taskList;
  void settaskList(TaskList? taskList) {
    _taskList = taskList;
    if (taskList != null && taskList.tasks != null) {
      setcompletedTasks(
          taskList.tasks!.where((element) => element.completed).length);
      settaskCount(taskList.tasks!.length);
    }
    notifyListeners();
  }

  TaskList? getTaskList() {
    var taskList = _taskRepository.getTaskList(_currentDate);
    settaskList(taskList);
    return taskList;
  }

  Future<void> saveTask(Task task) async {
    await _taskRepository.saveTask(task, _currentDate);
  }

  void addIdea(String idea) {
    //TODO add idea
  }
}
