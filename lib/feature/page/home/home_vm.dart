import 'package:listfull/core/base/base_view_model.dart';
import 'package:injectable/injectable.dart';
import 'package:listfull/feature/data/model/enums/category_enums.dart';
import 'package:listfull/feature/data/model/note.dart';
import 'package:listfull/feature/data/model/task.dart';
import 'package:listfull/feature/data/repository/notes_repository.dart';
import 'package:listfull/feature/data/repository/task_repository.dart';

@injectable
class HomeViewModel extends BaseViewModel {
  final TaskRepository _taskRepository;
  final NotesRepository _notesRepository;

  HomeViewModel(this._taskRepository, this._notesRepository);

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
    var resp = _taskRepository.getTaskListForLast7Days(DateTime.now());
    setlast7daysTasks(resp);
    return resp;
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
  void settaskList(TaskList? resp) {
    _taskList = resp;

    setcompletedTasks(
        resp?.tasks?.where((element) => element.completed).length ?? 0);
    settaskCount(resp?.tasks?.length ?? 0);

    notifyListeners();
  }

  TaskList? getTaskList() {
    var resp = _taskRepository.getTaskList(_currentDate);
    settaskList(resp);
    return resp;
  }

  Future<void> saveTask(Task task) async {
    await _taskRepository.saveTask(task, _currentDate);
  }

  //Save Note
  Future<void> saveNote(String note) async {
    await _notesRepository.saveNotes(Note(
      note: note,
      id: "note_${DateTime.now().millisecondsSinceEpoch}",
    ));
  }

  //Get Notes
  NoteList? _noteList;
  NoteList? get noteList => _noteList;
  void setnoteList(NoteList? noteList) {
    _noteList = noteList;
    notifyListeners();
  }

  NoteList? getNoteList() {
    var noteList = _notesRepository.getAllNotes();
    setnoteList(noteList);
    return noteList;
  }

  //Delete Task
  Future<void> deleteTask(Task task) async {
    await _taskRepository.deleteTask(task, _currentDate);
    notifyListeners();
  }
}
