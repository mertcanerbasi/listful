import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';
import 'package:listfull/core/extensions/datetime_extensions.dart';
import 'package:listfull/core/source/local_data_source.dart';
import 'package:listfull/feature/data/model/task.dart';
import 'package:listfull/feature/data/repository/task_repository.dart';

@LazySingleton(as: TaskRepository)
class TaskRepositoryImpl implements TaskRepository {
  final LocalDataSource _localDataSource;

  TaskRepositoryImpl(this._localDataSource);

  @override
  TaskList? getTaskList(DateTime date) {
    var yyyyMMdd = date.toYyyyMmDd();
    final taskList = _localDataSource.getData(yyyyMMdd, TaskList.fromJson);
    return taskList;
  }

  @override
  Future<void> saveTask(Task task, DateTime date) async {
    var yyyyMMdd = date.toYyyyMmDd();
    var taskList = getTaskList(date);
    if (taskList == null || taskList.tasks == null) {
      taskList = TaskList(tasks: [task], date: yyyyMMdd);
    } else {
      // If the task already exists, update it
      var existingTask =
          taskList.tasks!.firstWhereOrNull((t) => t.id == task.id);
      if (existingTask != null) {
        taskList.tasks!.remove(existingTask);
      }

      // If all tasks pomodoro is completed, mark the task as completed
      if (task.timePiece.every((element) => element.completed)) {
        task.completed = true;
      } else {
        task.completed = false;
      }

      taskList.tasks!.add(task);
    }
    await _localDataSource.setData(yyyyMMdd, taskList, (m) => m.toJson());
  }

  @override
  Future<void> clear() async {
    await _localDataSource.clear();
  }

  @override
  List<TaskList?> getTaskListForLast7Days(DateTime date) {
    List<TaskList?> taskList = [];
    for (int i = 0; i < 7; i++) {
      var yyyyMMdd = date.subtract(Duration(days: i)).toYyyyMmDd();
      taskList.add(_localDataSource.getData(yyyyMMdd, TaskList.fromJson));
    }
    return taskList;
  }
}
