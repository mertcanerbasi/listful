import 'package:injectable/injectable.dart';
import 'package:listfull/feature/data/service/app_service.dart';
import 'package:listfull/feature/data/repository/app_repository.dart';

@LazySingleton(as: AppRepository)
class AppRepositoryImpl extends AppRepository {
  final AppService _appService;
  AppRepositoryImpl(this._appService);

  @override
  Future<String> getAppVersion() {
    return _appService.getAppVersion();
  }
}
