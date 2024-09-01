import 'package:listfull/core/base/base_widget.dart';
import 'package:listfull/core/res/colors.gen.dart';
import 'package:listfull/feature/data/model/enums/category_enums.dart';
import 'package:listfull/feature/page/home/home_vm.dart';
import 'package:flutter/material.dart';
import 'package:listfull/feature/widgets/app_labels.dart';
import 'package:listfull/feature/widgets/days_list_widget.dart';
import 'package:listfull/feature/widgets/progress_widget.dart';
import 'package:listfull/feature/widgets/scaffold_body.dart';
import 'package:listfull/feature/widgets/total_tasks_widget.dart';
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
        TotalTasksWidget(
          completedTasks: viewModel.completedTasks,
          taskCount: viewModel.taskCount,
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Tasks marked in the",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const LinearGradient(
                          colors: <Color>[
                            AppColors.primary,
                            AppColors.secondary
                          ],
                        ).createShader(bounds);
                      },
                      child: const Text(
                        "last 7 days",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    ProgressWidget(
                      completedTasks: viewModel.last7daysCompletedTasks,
                      taskCount: viewModel.last7daysTaskCount,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      "%${((viewModel.last7daysCompletedTasks / viewModel.last7daysTaskCount) * 100).toStringAsFixed(0)}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(),
            )
          ],
        ),
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
