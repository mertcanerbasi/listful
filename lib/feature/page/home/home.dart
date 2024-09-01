import 'package:listfull/core/base/base_widget.dart';
import 'package:listfull/core/res/colors.gen.dart';
import 'package:listfull/feature/data/model/enums/category_enums.dart';
import 'package:listfull/feature/page/home/home_vm.dart';
import 'package:flutter/material.dart';
import 'package:listfull/feature/router/app_router.routes.dart';
import 'package:listfull/feature/widgets/app_labels.dart';
import 'package:listfull/feature/widgets/feeling_widget/feeling_widget.dart';
import 'package:listfull/feature/widgets/new_idea_widget.dart';
import 'package:listfull/feature/widgets/overview_widget.dart';
import 'package:listfull/feature/widgets/scaffold_body.dart';
import 'package:listfull/feature/widgets/tasks_view_widget.dart';
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
    //viewModel.clear();
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
                color: AppColors.primary,
                isSelected:
                    viewModel.selectedCategory == CategoryEnums.overview,
                onPressed: () {
                  viewModel.setselectedCategory(CategoryEnums.overview);
                },
              ),
              const SizedBox(width: 8),
              AppLabels.categoryLabel(
                text: "Tasks (${viewModel.taskCount})",
                color: AppColors.primary,
                isSelected: viewModel.selectedCategory == CategoryEnums.tasks,
                onPressed: () {
                  viewModel.setselectedCategory(CategoryEnums.tasks);
                },
              ),
              const SizedBox(width: 8),
              AppLabels.categoryLabel(
                text: "Notes",
                color: AppColors.primary,
                isSelected: viewModel.selectedCategory == CategoryEnums.notes,
                onPressed: () {
                  viewModel.setselectedCategory(CategoryEnums.notes);
                },
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: _getSelectedWidget(viewModel.selectedCategory),
        ),
      ],
    );
  }

  Widget _getSelectedWidget(CategoryEnums category) {
    switch (category) {
      case CategoryEnums.overview:
        return OverViewWidget(
            viewModel: viewModel, key: const ValueKey('overview'));
      case CategoryEnums.tasks:
        return TasksViewWidget(
          taskList: viewModel.taskList,
          key: const ValueKey('tasks'),
        );
      case CategoryEnums.notes:
        return const Text("Notes", key: ValueKey('notes'));
      default:
        return Container();
    }
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
