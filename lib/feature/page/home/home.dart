import 'package:listfull/core/base/base_widget.dart';
import 'package:listfull/core/res/colors.gen.dart';
import 'package:listfull/feature/data/model/enums/category_enums.dart';
import 'package:listfull/feature/page/home/home_vm.dart';
import 'package:flutter/material.dart';
import 'package:listfull/feature/router/app_router.routes.dart';
import 'package:listfull/feature/widgets/app_labels.dart';
import 'package:listfull/feature/widgets/day_statistics_widget.dart';
import 'package:listfull/feature/widgets/days_list_widget.dart';
import 'package:listfull/feature/widgets/feeling_widget/feeling_widget.dart';
import 'package:listfull/feature/widgets/last_7_days_compilation_widget.dart';
import 'package:listfull/feature/widgets/new_idea_widget.dart';
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
  final TextEditingController _ideaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    viewModel.getTaskList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScaffoldBody(
        isLoading: viewModel.isLoading,
        body: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            HomeWelcomeWidget(
              onSettingsPressed: () {
                SettingsRoute().push(context);
              },
              onAddTaskPressed: () {
                NewTaskRoute().push(context).then((value) {
                  if (value == true) {
                    viewModel.getTaskList();
                  }
                });
              },
              taskCount: viewModel.taskCount,
            ),
            const SizedBox(height: 16),
            DayManagementWidget(viewModel: viewModel),
            const SizedBox(height: 16),
            const FeelingWidget(),
            const SizedBox(height: 16),
            NewIdeaWidget(
                ideaController: _ideaController,
                onSave: () {
                  viewModel.addIdea(_ideaController.text);
                  _ideaController.clear();
                }),
            //Space for sliding
            const SizedBox(
              height: 60,
            )
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
            Last7DaysCompilationWidget(
              last7daysCompletedTasks: viewModel.last7daysCompletedTasks,
              last7daysTaskCount: viewModel.last7daysTaskCount,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Container(
                height: 130,
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return const LinearGradient(
                              colors: <Color>[
                                AppColors.primary,
                                AppColors.secondary,
                              ],
                            ).createShader(bounds);
                          },
                          child: const Text(
                            "Last 7 Days",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Text(
                          " Statistics",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Expanded(
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          DayStatisticsWidget(
                            dayAbbreviation: "Mon",
                            completed: 3,
                            total: 5,
                            currentDate: viewModel.currentDate,
                          ),
                          DayStatisticsWidget(
                            dayAbbreviation: "Tue",
                            completed: 3,
                            total: 5,
                            currentDate: viewModel.currentDate,
                          ),
                          DayStatisticsWidget(
                            dayAbbreviation: "Wed",
                            completed: 3,
                            total: 5,
                            currentDate: viewModel.currentDate,
                          ),
                          DayStatisticsWidget(
                            dayAbbreviation: "Thu",
                            completed: 3,
                            total: 5,
                            currentDate: viewModel.currentDate,
                          ),
                          DayStatisticsWidget(
                            dayAbbreviation: "Fri",
                            completed: 3,
                            total: 5,
                            currentDate: viewModel.currentDate,
                          ),
                          DayStatisticsWidget(
                            dayAbbreviation: "Sat",
                            completed: 3,
                            total: 5,
                            currentDate: viewModel.currentDate,
                          ),
                          DayStatisticsWidget(
                            dayAbbreviation: "Sun",
                            completed: 3,
                            total: 5,
                            currentDate: viewModel.currentDate,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

class HomeWelcomeWidget extends StatelessWidget {
  final VoidCallback onSettingsPressed;
  final VoidCallback onAddTaskPressed;
  final int taskCount;
  const HomeWelcomeWidget({
    super.key,
    required this.onSettingsPressed,
    required this.onAddTaskPressed,
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
              onPressed: onSettingsPressed,
              icon: const Icon(
                Icons.settings,
                size: 36,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: onAddTaskPressed,
              child: const Icon(
                Icons.add,
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
