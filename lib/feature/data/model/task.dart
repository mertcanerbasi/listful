import 'package:json_annotation/json_annotation.dart';
import 'package:listfull/feature/data/model/enums/priority_enums.dart';

part 'task.g.dart';

@JsonSerializable()
class TaskList {
  final List<Task>? tasks;
  final String date;

  TaskList({required this.tasks, required this.date});

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
  final List<Pomodoro> timePiece;
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

@JsonSerializable()
class Pomodoro {
  final int minutes;
  final bool completed;

  Pomodoro({
    required this.minutes,
    required this.completed,
  });

  //Json serialization
  factory Pomodoro.fromJson(Map<String, dynamic> json) {
    return _$PomodoroFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PomodoroToJson(this);
}
