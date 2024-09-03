// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:listfull/core/config/app_config.dart' as _i481;
import 'package:listfull/core/di/module/api_module.dart' as _i697;
import 'package:listfull/core/di/module/app_module.dart' as _i852;
import 'package:listfull/core/source/app_storage.dart' as _i133;
import 'package:listfull/core/source/local_data_source.dart' as _i855;
import 'package:listfull/feature/data/repository/app_repository.dart' as _i380;
import 'package:listfull/feature/data/repository/app_repository_impl.dart'
    as _i634;
import 'package:listfull/feature/data/repository/mood_repository.dart' as _i42;
import 'package:listfull/feature/data/repository/mood_repository_impl.dart'
    as _i693;
import 'package:listfull/feature/data/repository/notes_repository.dart'
    as _i351;
import 'package:listfull/feature/data/repository/notes_repository_impl.dart'
    as _i93;
import 'package:listfull/feature/data/repository/task_repository.dart' as _i742;
import 'package:listfull/feature/data/repository/task_repository_impl.dart'
    as _i1052;
import 'package:listfull/feature/data/service/app_service.dart' as _i655;
import 'package:listfull/feature/page/app/app_vm.dart' as _i78;
import 'package:listfull/feature/page/home/home_vm.dart' as _i454;
import 'package:listfull/feature/page/new_task/new_task_vm.dart' as _i361;
import 'package:listfull/feature/page/notes/notes_vm.dart' as _i877;
import 'package:listfull/feature/page/pomodoro/pomodoro_vm.dart' as _i281;
import 'package:listfull/feature/page/settings/settings_vm.dart' as _i843;
import 'package:listfull/feature/widgets/feeling_widget/feeling_vm.dart'
    as _i211;

const String _dev = 'dev';
const String _prod = 'prod';
const String _test = 'test';

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final apiModule = _$ApiModule();
    final appModule = _$AppModule();
    gh.lazySingleton<_i361.Dio>(() => apiModule.injectRetrofitAPI);
    gh.factory<_i843.SettingsViewModel>(() => _i843.SettingsViewModel());
    gh.singleton<_i481.AppConfig>(
      () => _i481.AppConfigDevImpl(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i655.AppService>(
      () => apiModule.appServiceMock,
      registerFor: {_dev},
    );
    await gh.factoryAsync<_i133.AppStorage>(
      () => appModule.localDataSource,
      registerFor: {
        _dev,
        _prod,
      },
      preResolve: true,
    );
    gh.singleton<_i855.LocalDataSource>(
      () => _i855.TestLocalDataSourceImpl(),
      registerFor: {_test},
    );
    gh.lazySingleton<_i351.NotesRepository>(
        () => _i93.NotesRepositoryImpl(gh<_i855.LocalDataSource>()));
    gh.singleton<_i481.AppConfig>(
      () => _i481.AppConfigProdImpl(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i380.AppRepository>(
        () => _i634.AppRepositoryImpl(gh<_i655.AppService>()));
    gh.lazySingleton<_i655.AppService>(
      () => apiModule.appService,
      registerFor: {_prod},
    );
    gh.singleton<_i855.LocalDataSource>(
      () => _i855.LocalDataSourceImpl(gh<_i133.AppStorage>()),
      registerFor: {
        _prod,
        _dev,
      },
    );
    gh.lazySingleton<_i742.TaskRepository>(
        () => _i1052.TaskRepositoryImpl(gh<_i855.LocalDataSource>()));
    gh.factory<_i877.NotesViewModel>(
        () => _i877.NotesViewModel(gh<_i351.NotesRepository>()));
    gh.singleton<_i78.AppViewModel>(
        () => _i78.AppViewModel(gh<_i855.LocalDataSource>()));
    gh.factory<_i454.HomeViewModel>(() => _i454.HomeViewModel(
          gh<_i742.TaskRepository>(),
          gh<_i351.NotesRepository>(),
        ));
    gh.lazySingleton<_i42.MoodRepository>(
        () => _i693.MoodRepositoryImpl(gh<_i855.LocalDataSource>()));
    gh.factory<_i211.FeelingViewModel>(
        () => _i211.FeelingViewModel(gh<_i42.MoodRepository>()));
    gh.factory<_i361.NewTaskViewModel>(
        () => _i361.NewTaskViewModel(gh<_i742.TaskRepository>()));
    gh.factory<_i281.PomodoroViewModel>(
        () => _i281.PomodoroViewModel(gh<_i742.TaskRepository>()));
    return this;
  }
}

class _$ApiModule extends _i697.ApiModule {}

class _$AppModule extends _i852.AppModule {}
