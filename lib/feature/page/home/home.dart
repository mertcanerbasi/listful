import 'package:listfull/core/base/base_widget.dart';
import 'package:listfull/core/res/colors.gen.dart';
import 'package:listfull/feature/data/model/enums/category_enums.dart';
import 'package:listfull/feature/page/home/home_vm.dart';
import 'package:flutter/material.dart';
import 'package:listfull/feature/widgets/app_labels.dart';
import 'package:listfull/feature/widgets/days_list_widget.dart';
import 'package:listfull/feature/widgets/scaffold_body.dart';
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
      body: ScaffoldBody(
        isLoading: viewModel.isLoading,
        body: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            HomeWelcomeWidget(
              onNotificationPressed: () {},
              onProfilePressed: () {},
              taskCount: viewModel.taskCount,
            ),
            const SizedBox(height: 16),
            DayManagementWidget(viewModel: viewModel)
          ],
        ),
      ),
    );
  }
}

class DayManagementWidget extends StatelessWidget {
  const DayManagementWidget({
    super.key,
    required this.viewModel,
  });

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          "Manage Your Day",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 30,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: [
              AppLabels.categoryLabel(
                text: "Overview",
                isSelected:
                    viewModel.selectedCategory == CategoryEnums.overview,
                onPressed: () {
                  viewModel.setselectedCategory(CategoryEnums.overview);
                },
              ),
              const SizedBox(width: 8),
              AppLabels.categoryLabel(
                text: "Tasks (${viewModel.taskCount})",
                isSelected: viewModel.selectedCategory == CategoryEnums.tasks,
                onPressed: () {
                  viewModel.setselectedCategory(CategoryEnums.tasks);
                },
              ),
              const SizedBox(width: 8),
              AppLabels.categoryLabel(
                text: "Reminders",
                isSelected:
                    viewModel.selectedCategory == CategoryEnums.reminders,
                onPressed: () {
                  viewModel.setselectedCategory(CategoryEnums.reminders);
                },
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        DaysList(
          viewModel: viewModel,
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          child: Column(
            children: [
              ListTile(
                title: const Text("Total Tasks",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    )),
                subtitle: const Text(
                  "Daily tasks",
                ),
                leading: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.graphic_eq,
                    color: Colors.white,
                  ),
                ),
                trailing: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "${viewModel.completedTasks}/${viewModel.taskCount}",
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                width: double.maxFinite,
                height: 3,
                child: Row(
                  children: [
                    Expanded(
                      flex: viewModel.completedTasks,
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppColors.primary,
                              AppColors.secondary,
                            ],
                          ),
                        ),
                        height: 3,
                      ),
                    ),
                    Expanded(
                      flex: viewModel.taskCount - viewModel.completedTasks,
                      child: Container(
                        color: AppColors.primary.withOpacity(0.2),
                        height: 3,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class HomeWelcomeWidget extends StatelessWidget {
  final VoidCallback onNotificationPressed;
  final VoidCallback onProfilePressed;
  final int taskCount;
  const HomeWelcomeWidget({
    super.key,
    required this.onNotificationPressed,
    required this.onProfilePressed,
    required this.taskCount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(
              child: Text(
                "Today",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            IconButton(
              onPressed: onNotificationPressed,
              icon: const Icon(
                Icons.notifications_outlined,
                size: 36,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: onProfilePressed,
              child: const Icon(
                Icons.person,
                color: Colors.white,
                size: 36,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Hello,",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            const Text(
              "Good Morning 👋",
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                      colors: <Color>[AppColors.primary, AppColors.secondary],
                    ).createShader(bounds);
                  },
                  blendMode: BlendMode.srcATop,
                  child: const Text(
                    "You have to complete ",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Text(
                  "$taskCount tasks ",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                      colors: <Color>[AppColors.primary, AppColors.secondary],
                    ).createShader(bounds);
                  },
                  blendMode: BlendMode.srcATop,
                  child: const Text(
                    "today",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Divider(
              color: AppColors.cardBackground,
              thickness: 3,
            ),
          ],
        )
      ],
    );
  }
}
