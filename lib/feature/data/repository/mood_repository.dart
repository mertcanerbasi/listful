import 'package:listfull/feature/data/model/mood.dart';

abstract class MoodRepository {
  Future<void> saveMood(Mood mood, DateTime date);
  Mood? getMood(DateTime date);
}
