import 'package:flutter/material.dart';
import 'package:listfull/core/base/base_widget.dart';
import 'package:listfull/core/res/colors.gen.dart';
import 'package:listfull/core/res/theme.dart';
import 'package:listfull/feature/data/model/enums/priority_enums.dart';
import 'package:listfull/feature/page/new_task/new_task_vm.dart';
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
  final TextEditingController _taskPomodorosController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My New Task 💎'), //Diamond Symbol
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onTap: () {},
        child: Container(
          width: 200,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: AppColors.primary,
              width: 2,
            ),
            gradient: const LinearGradient(
              colors: [AppColors.primary, AppColors.secondary],
            ),
          ),
          child: const Center(
            child: Text(
              'Create Task',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
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
                _taskPomodorosController,
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
        const SizedBox(height: 8),
        TextField(
          style: const TextStyle(color: Colors.white, fontSize: 16),
          controller: controllers[3],
          readOnly: true,
          onTap: () {},
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: 'Enter number of pomodoros 🍅',
            hintStyle: const TextStyle(color: Colors.grey),
            border: AppTheme.noRoundedInputBorder,
            enabledBorder: AppTheme.noRoundedInputBorder,
            focusedBorder: AppTheme.noRoundedInputBorder,
            filled: true,
            fillColor: AppColors.cardBackground,
          ),
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
