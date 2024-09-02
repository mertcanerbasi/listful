// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskList _$TaskListFromJson(Map<String, dynamic> json) => TaskList(
      tasks: (json['tasks'] as List<dynamic>?)
          ?.map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList(),
      date: json['date'] as String?,
    );

Map<String, dynamic> _$TaskListToJson(TaskList instance) => <String, dynamic>{
      'tasks': instance.tasks,
      'date': instance.date,
    };

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      title: json['title'] as String,
      id: (json['id'] as num).toInt(),
      completed: json['completed'] as bool,
      timePiece: (json['timePiece'] as List<dynamic>)
          .map((e) => Pomodoro.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String,
      priority: $enumDecode(_$PriorityEnumsEnumMap, json['priority']),
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'title': instance.title,
      'id': instance.id,
      'completed': instance.completed,
      'timePiece': instance.timePiece,
      'description': instance.description,
      'priority': _$PriorityEnumsEnumMap[instance.priority]!,
    };

const _$PriorityEnumsEnumMap = {
  PriorityEnums.low: 'low',
  PriorityEnums.medium: 'medium',
  PriorityEnums.high: 'high',
};

Pomodoro _$PomodoroFromJson(Map<String, dynamic> json) => Pomodoro(
      minutes: (json['minutes'] as num).toInt(),
      completed: json['completed'] as bool,
    );

Map<String, dynamic> _$PomodoroToJson(Pomodoro instance) => <String, dynamic>{
      'minutes': instance.minutes,
      'completed': instance.completed,
    };
