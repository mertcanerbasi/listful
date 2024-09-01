import 'package:injectable/injectable.dart';
import 'package:listfull/core/extensions/datetime_extensions.dart';
import 'package:listfull/core/source/local_data_source.dart';
import 'package:listfull/feature/data/model/mood.dart';
import 'package:listfull/feature/data/repository/mood_repository.dart';

@LazySingleton(as: MoodRepository)
class MoodRepositoryImpl implements MoodRepository {
  final LocalDataSource _localDataSource;

  MoodRepositoryImpl(this._localDataSource);

  @override
  Mood? getMood(DateTime date) {
    var yyyyMMdd = date.toYyyyMmDd();
    final mood = _localDataSource.getData(yyyyMMdd, Mood.fromJson);
    return mood;
  }

  @override
  Future<void> saveMood(Mood mood, DateTime date) async {
    var yyyyMMdd = date.toYyyyMmDd();
    await _localDataSource.setData(yyyyMMdd, mood, (m) => m.toJson());
  }
}
