import 'package:json_annotation/json_annotation.dart';

part 'note.g.dart';

@JsonSerializable()
class NoteList {
  final List<Note>? notes;

  NoteList({required this.notes});

  //Json serialization
  factory NoteList.fromJson(Map<String, dynamic> json) {
    return _$NoteListFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NoteListToJson(this);
}

@JsonSerializable()
class Note {
  final String note;
  final String id;

  Note({
    required this.note,
    required this.id,
  });

  //Json serialization
  factory Note.fromJson(Map<String, dynamic> json) {
    return _$NoteFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NoteToJson(this);
}
