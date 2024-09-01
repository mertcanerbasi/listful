import 'package:listfull/feature/data/model/task.dart';

abstract class TaskRepository {
  Future<void> saveTask(Task task, DateTime date);
  TaskList? getTaskList(DateTime date);
  Future<void> clear();
  List<TaskList?> getTaskListForLast7Days(DateTime date);
}
