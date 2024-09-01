// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoteList _$NoteListFromJson(Map<String, dynamic> json) => NoteList(
      notes: (json['notes'] as List<dynamic>?)
          ?.map((e) => Note.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NoteListToJson(NoteList instance) => <String, dynamic>{
      'notes': instance.notes,
    };

Note _$NoteFromJson(Map<String, dynamic> json) => Note(
      note: json['note'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$NoteToJson(Note instance) => <String, dynamic>{
      'note': instance.note,
      'id': instance.id,
    };
