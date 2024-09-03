import 'package:listfull/core/base/base_view_model.dart';
import 'package:listfull/core/source/local_data_source.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class AppViewModel extends BaseViewModel {
  final LocalDataSource _localDataSource;
  AppViewModel(this._localDataSource);

  Locale? get locale => _localDataSource.locale;
  Future setLocale(Locale locale) => _localDataSource.setLocale(locale);

  ThemeMode get appearance => _localDataSource.appearance;
  Future setDarkMode(ThemeMode appearance) =>
      _localDataSource.setAppearance(appearance).then((value) {
        notifyListeners();
      });
}
