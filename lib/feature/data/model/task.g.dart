// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskList _$TaskListFromJson(Map<String, dynamic> json) => TaskList(
      tasks: (json['tasks'] as List<dynamic>?)
          ?.map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TaskListToJson(TaskList instance) => <String, dynamic>{
      'tasks': instance.tasks,
    };

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      title: json['title'] as String,
      id: (json['id'] as num).toInt(),
      completed: json['completed'] as bool,
      timePiece: (json['timePiece'] as num).toInt(),
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
