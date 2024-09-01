import 'package:injectable/injectable.dart';
import 'package:listfull/core/source/local_data_source.dart';
import 'package:listfull/feature/data/model/mood.dart';
import 'package:listfull/feature/data/repository/mood_repository.dart';

@LazySingleton(as: MoodRepository)
class MoodRepositoryImpl implements MoodRepository {
  final LocalDataSource _localDataSource;

  MoodRepositoryImpl(this._localDataSource);

  @override
  Mood? getMood(DateTime date) {
    var yyyyMMdd =
        '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
    final mood = _localDataSource.getData(yyyyMMdd, Mood.fromJson);
    return mood;
  }

  @override
  Future<void> saveMood(Mood mood, DateTime date) async {
    var yyyyMMdd =
        '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
    await _localDataSource.setData(yyyyMMdd, mood, (m) => m.toJson());
  }
}
