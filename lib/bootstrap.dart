import 'dart:async';
import 'dart:developer';

import 'package:alarm/alarm.dart';
import 'package:listfull/core/di/locator.dart';
import 'package:listfull/core/logger.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder, String env) async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    FlutterError.onError = (details) {
      log(details.exceptionAsString(), stackTrace: details.stack);
      FlutterError.dumpErrorToConsole(details);
    };
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    await Alarm.init();
    await setupDI(env);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky)
        .then((_) async {
      runApp(await builder());
    });
  }, (error, stackTrace) {
    Log.e(error.toString(), tag: "Zone Error");
    Log.e(stackTrace.toString(), tag: "Zone StackTrace");
  });
}
