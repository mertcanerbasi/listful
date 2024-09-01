// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// RouteMapConfigGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:route_map/route_map.dart';
import 'package:listfull/feature/page/settings/settings.dart';
import 'package:listfull/feature/page/home/home.dart';

class RouteMaps {
  static const String settingsRoute = "settings";
  static const String root = "/";
}

Map<String, RouteModel> get routes => _routes;
final Map<String, RouteModel> _routes = {
  RouteMaps.settingsRoute: RouteModel(
    (_) => const SettingsPage(),
  ),
  RouteMaps.root: RouteModel(
    (_) => const HomePage(),
  ),
};
Route? $onGenerateRoute(RouteSettings routeSettings,
        {String? Function(String routeName)? redirect}) =>
    onGenerateRouteWithRoutesSettings(
      routeSettings,
      routes,
      redirect: redirect,
    );

class SettingsRoute extends BaseRoute {
  SettingsRoute() : super(RouteMaps.settingsRoute);
  static const String name = RouteMaps.settingsRoute;
}

class HomeRoute extends BaseRoute {
  HomeRoute() : super(RouteMaps.root);
  static const String name = RouteMaps.root;
}
