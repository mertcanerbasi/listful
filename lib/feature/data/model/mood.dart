import 'package:json_annotation/json_annotation.dart';

part 'mood.g.dart';

@JsonSerializable()
class Mood {
  final String emoji;
  final String label;

  Mood({required this.emoji, required this.label});

  //Json serialization
  factory Mood.fromJson(Map<String, dynamic> json) {
    return _$MoodFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MoodToJson(this);
}
