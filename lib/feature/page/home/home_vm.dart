import 'package:listfull/core/base/base_view_model.dart';
import 'package:injectable/injectable.dart';
import 'package:listfull/feature/data/model/enums/category_enums.dart';
import 'package:listfull/feature/data/model/task.dart';
import 'package:listfull/feature/data/repository/task_repository.dart';

@injectable
class HomeViewModel extends BaseViewModel {
  final TaskRepository _taskRepository;

  HomeViewModel(this._taskRepository);

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

  int _last7daysTaskCount = 25;
  int get last7daysTaskCount => _last7daysTaskCount;
  void setlast7daysTaskCount(int last7daysTaskCount) {
    _last7daysTaskCount = last7daysTaskCount;
    notifyListeners();
  }

  int _last7daysCompletedTasks = 12;
  int get last7daysCompletedTasks => _last7daysCompletedTasks;
  void setlast7daysCompletedTasks(int last7daysCompletedTasks) {
    _last7daysCompletedTasks = last7daysCompletedTasks;
    notifyListeners();
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
