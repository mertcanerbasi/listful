import 'package:listfull/bootstrap.dart';
import 'package:listfull/feature/page/app/app.dart';
import 'package:injectable/injectable.dart';

void main() async {
  bootstrap(() => const App(), Environment.dev);
}
