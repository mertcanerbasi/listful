import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:listfull/core/di/locator.config.dart';

GetIt getIt = GetIt.instance;
@InjectableInit()
Future setupDI(String environment) => getIt.init(environment: environment);
