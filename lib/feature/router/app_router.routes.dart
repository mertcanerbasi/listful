// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// RouteMapConfigGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:route_map/route_map.dart';
import 'package:listfull/feature/page/settings/settings.dart';
import 'package:listfull/feature/page/home/home.dart';
import 'package:listfull/feature/page/new_task/new_task.dart';
import 'package:listfull/feature/page/pomodoro/pomodoro.dart';
import 'package:listfull/feature/page/notes/notes.dart';
import 'package:listfull/feature/data/model/task.dart';

class RouteMaps {
  static const String settingsRoute = "settings";
  static const String root = "/";
  static const String newTaskRoute = "/new_task_page";
  static const String pomodoroRoute = "/pomodoro_page";
  static const String notesRoute = "/notes_page";
}

Map<String, RouteModel> get routes => _routes;
final Map<String, RouteModel> _routes = {
  RouteMaps.settingsRoute: RouteModel(
    (_) => const SettingsPage(),
  ),
  RouteMaps.root: RouteModel(
    (_) => const HomePage(),
  ),
  RouteMaps.newTaskRoute: RouteModel(
    (_) => const NewTaskPage(),
    fullscreenDialog: true,
  ),
  RouteMaps.pomodoroRoute: RouteModel(
    (c) => PomodoroPage(
      task: c.routeArgsWithKey<Task>("task")!,
    ),
  ),
  RouteMaps.notesRoute: RouteModel(
    (_) => const NotesPage(),
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

class NewTaskRoute extends BaseRoute {
  NewTaskRoute() : super(RouteMaps.newTaskRoute);
  static const String name = RouteMaps.newTaskRoute;
}

class PomodoroRoute extends BaseRoute {
  PomodoroRoute({
    required Task task,
  }) : super(RouteMaps.pomodoroRoute,
            args: PomodoroRouteArgs(
              task: task,
            ).map);
  static const String name = RouteMaps.pomodoroRoute;
}

class PomodoroRouteArgs {
  final Task task;
  PomodoroRouteArgs({
    required this.task,
  });
  Map<String, dynamic>? get map => {
        "task": task,
      };
}

class NotesRoute extends BaseRoute {
  NotesRoute() : super(RouteMaps.notesRoute);
  static const String name = RouteMaps.notesRoute;
}
