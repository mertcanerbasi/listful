import 'package:flutter/material.dart';
import 'package:listfull/core/base/base_widget.dart';
import 'package:listfull/core/extensions/datetime_extensions.dart';
import 'package:listfull/core/res/colors.gen.dart';
import 'package:listfull/core/res/theme.dart';
import 'package:listfull/feature/data/model/enums/priority_enums.dart';
import 'package:listfull/feature/data/model/task.dart';
import 'package:listfull/feature/page/new_task/new_task_vm.dart';
import 'package:listfull/feature/widgets/app_buttons.dart';
import 'package:listfull/feature/widgets/app_labels.dart';
import 'package:listfull/feature/widgets/scaffold_body.dart';
import 'package:route_map/route_map.dart';

@RouteMap(
  fullScreenDialog: true,
)
class NewTaskPage extends StatefulWidget {
  const NewTaskPage({super.key});

  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends BaseState<NewTaskViewModel, NewTaskPage> {
  final TextEditingController _taskTitleController = TextEditingController();
  final TextEditingController _taskDescriptionController =
      TextEditingController();
  final TextEditingController _taskDateController = TextEditingController();
  final TextEditingController _taskTimeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _taskDateController.text = viewModel.taskDate.toYyyyMmDd();
    _taskTimeController.text = '${viewModel.pomodoroTime} minutes';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My New Task 💎'), //Diamond Symbol
      ),
      body: ScaffoldBody(
        isLoading: false,
        body: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            const NewTaskTitleWidget(),
            const SizedBox(height: 16),
            TaskFieldsWidget(
              viewModel: viewModel,
              controllers: [
                _taskTitleController,
                _taskDescriptionController,
                _taskDateController,
                _taskTimeController,
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TaskFieldsWidget extends StatelessWidget {
  final NewTaskViewModel viewModel;
  final List<TextEditingController> controllers;
  const TaskFieldsWidget({
    super.key,
    required this.viewModel,
    required this.controllers,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Task Title',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          style: const TextStyle(color: Colors.white, fontSize: 16),
          controller: controllers[0],
          decoration: InputDecoration(
            hintText: 'Enter task title 🏆',
            hintStyle: const TextStyle(color: Colors.grey),
            border: AppTheme.noRoundedInputBorder,
            enabledBorder: AppTheme.noRoundedInputBorder,
            focusedBorder: AppTheme.noRoundedInputBorder,
            filled: true,
            fillColor: AppColors.cardBackground,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Task Description',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          style: const TextStyle(color: Colors.white, fontSize: 16),
          controller: controllers[1],
          decoration: InputDecoration(
            hintText: 'Enter task description ✉️',
            hintStyle: const TextStyle(color: Colors.grey),
            border: AppTheme.noRoundedInputBorder,
            enabledBorder: AppTheme.noRoundedInputBorder,
            focusedBorder: AppTheme.noRoundedInputBorder,
            filled: true,
            fillColor: AppColors.cardBackground,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Date',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          style: const TextStyle(color: Colors.white, fontSize: 16),
          controller: controllers[2],
          readOnly: true,
          onTap: () {},
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.calendar_today, color: Colors.white),
            hintText: 'Task Date',
            hintStyle: const TextStyle(color: Colors.grey),
            border: AppTheme.noRoundedInputBorder,
            enabledBorder: AppTheme.noRoundedInputBorder,
            focusedBorder: AppTheme.noRoundedInputBorder,
            filled: true,
            fillColor: AppColors.cardBackground,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Priority',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: AppLabels.priorityLabel(
                text: 'Low',
                isSelected: viewModel.selectedPriority == PriorityEnums.low,
                onPressed: () {
                  viewModel.setselectedPriority(PriorityEnums.low);
                },
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: AppLabels.priorityLabel(
                text: 'Medium',
                isSelected: viewModel.selectedPriority == PriorityEnums.medium,
                onPressed: () {
                  viewModel.setselectedPriority(PriorityEnums.medium);
                },
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: AppLabels.priorityLabel(
                text: 'High',
                isSelected: viewModel.selectedPriority == PriorityEnums.high,
                onPressed: () {
                  viewModel.setselectedPriority(PriorityEnums.high);
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text(
          'Pomodoros',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          'How many pomodoros will you spend on this task? 🍅',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: IconButton(
                icon: const Icon(
                  Icons.remove,
                  color: Colors.white,
                  size: 24,
                ),
                onPressed: () {
                  viewModel.decreasePomodoro();
                },
              ),
            ),
            Expanded(
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    colors: [AppColors.primary, AppColors.secondary],
                  ).createShader(bounds);
                },
                child: Text(
                  viewModel.pomodoroCount.toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              child: IconButton(
                icon: const Icon(Icons.add, color: Colors.white, size: 24),
                onPressed: () {
                  viewModel.increasePomodoro();
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text(
          'Pomodoro Time',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          style: const TextStyle(color: Colors.white, fontSize: 16),
          controller: controllers[3],
          readOnly: true,
          onTap: () {},
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.hourglass_bottom, color: Colors.white),
            hintText: '',
            hintStyle: const TextStyle(color: Colors.grey),
            border: AppTheme.noRoundedInputBorder,
            enabledBorder: AppTheme.noRoundedInputBorder,
            focusedBorder: AppTheme.noRoundedInputBorder,
            filled: true,
            fillColor: AppColors.cardBackground,
          ),
        ),
        const SizedBox(height: 50),
        AppButtons.gradientBorderButton(
          text: 'Create Task',
          onPressed: () async {
            if (viewModel.checkTaskValid(
              Task(
                title: controllers[0].text,
                description: controllers[1].text,
                completed: false,
                priority: viewModel.selectedPriority,
                timePiece: List.generate(
                  viewModel.pomodoroCount,
                  (index) => Pomodoro(
                    completed: false,
                    minutes: viewModel.pomodoroTime,
                  ),
                ),
                id: DateTime.now().millisecondsSinceEpoch,
              ),
            )) {
              await viewModel
                  .saveTask(
                Task(
                  title: controllers[0].text,
                  description: controllers[1].text,
                  completed: false,
                  priority: viewModel.selectedPriority,
                  timePiece: List.generate(
                    viewModel.pomodoroCount,
                    (index) => Pomodoro(
                      completed: false,
                      minutes: viewModel.pomodoroTime,
                    ),
                  ),
                  id: DateTime.now().millisecondsSinceEpoch,
                ),
              )
                  .then((value) {
                Navigator.pop(context, true);
              });
            }
          },
        ),
      ],
    );
  }
}

class NewTaskTitleWidget extends StatelessWidget {
  const NewTaskTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Create New Focus Plan',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          'What do you want to focus on today?',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 12),
        Divider(
          color: AppColors.cardBackground,
          thickness: 3,
        ),
      ],
    );
  }
}
