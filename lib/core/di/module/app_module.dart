import 'package:injectable/injectable.dart';
import 'package:listfull/core/source/app_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class AppModule {
  @Environment(Environment.dev)
  @Environment(Environment.prod)
  @preResolve
  Future<AppStorage> get localDataSource async {
    return SharedPreferences.getInstance().then((value) {
      return AppStorage(value);
    });
  }
}
