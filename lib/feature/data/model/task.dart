import 'package:json_annotation/json_annotation.dart';
import 'package:listfull/feature/data/model/enums/priority_enums.dart';

part 'task.g.dart';

@JsonSerializable()
class TaskList {
  final List<Task>? tasks;

  TaskList({required this.tasks});

  //Json serialization
  factory TaskList.fromJson(Map<String, dynamic> json) {
    return _$TaskListFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TaskListToJson(this);
}

@JsonSerializable()
class Task {
  final String title;
  final int id;
  final bool completed;
  final int timePiece;
  final String description;
  final PriorityEnums priority;

  Task({
    required this.title,
    required this.id,
    required this.completed,
    required this.timePiece,
    required this.description,
    required this.priority,
  });

  //Json serialization
  factory Task.fromJson(Map<String, dynamic> json) {
    return _$TaskFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}
