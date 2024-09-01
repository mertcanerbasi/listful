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
    if (taskList == null && taskList?.tasks == null) {
      taskList = TaskList(tasks: [task]);
    } else {
      taskList!.tasks!.add(task);
    }
    await _localDataSource.setData(yyyyMMdd, taskList, (m) => m.toJson());
  }
}
