import 'package:listfull/core/base/base_widget.dart';
import 'package:listfull/feature/page/home/home_vm.dart';
import 'package:listfull/core/res/icons.dart';
import 'package:listfull/core/res/l10n/l10n.dart';
import 'package:listfull/feature/router/app_router.routes.dart';
import 'package:flutter/material.dart';
import 'package:listfull/feature/widgets/app_buttons.dart';
import 'package:listfull/feature/widgets/app_labels.dart';
import 'package:route_map/route_map.dart';

@RouteMap(name: "/")
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomeViewModel, HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.home),
        actions: [
          IconButton.filled(
              onPressed: () {
                SettingsRoute().push(context);
              },
              icon: const Icon(AppIcons.settings))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppLabels.priorityLabel(
              text: "Hight",
              isSelected: true,
              onPressed: () {},
            ),
            const SizedBox(height: 16),
            AppLabels.dateLabel(
              date: DateTime.now(),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
