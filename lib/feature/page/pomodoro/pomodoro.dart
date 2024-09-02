import 'package:flutter/material.dart';
import 'package:listfull/core/base/base_widget.dart';
import 'package:listfull/core/res/colors.gen.dart';
import 'package:listfull/core/res/theme.dart';
import 'package:listfull/feature/data/model/enums/priority_enums.dart';
import 'package:listfull/feature/data/model/task.dart';
import 'package:listfull/feature/page/pomodoro/pomodoro_vm.dart';
import 'package:listfull/feature/widgets/app_buttons.dart';
import 'package:listfull/feature/widgets/app_labels.dart';
import 'package:listfull/feature/widgets/scaffold_body.dart';
import 'package:route_map/route_map.dart';

@RouteMap()
class PomodoroPage extends StatefulWidget {
  final Task task;
  const PomodoroPage({super.key, required this.task});

  @override
  _PomodoroState createState() => _PomodoroState();
}

class _PomodoroState extends BaseState<PomodoroViewModel, PomodoroPage> {
  final TextEditingController _taskTitleController = TextEditingController();
  final TextEditingController _taskDescriptionController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    viewModel.settask(widget.task);
    _taskTitleController.text = widget.task.title;
    _taskDescriptionController.text = widget.task.description;
    viewModel.setprioritySelected(widget.task.priority);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(viewModel.task.title),
        actions: [
          IconButton(
            onPressed: () {
              viewModel.setisEditing();
            },
            icon: Icon(
              viewModel.isEditing ? Icons.save : Icons.mode_edit,
            ),
          ),
        ],
      ),
      body: ScaffoldBody(
        isLoading: false,
        body: ListView(
          children: [
            const GetStartedPomodoroWidget(),
            const SizedBox(height: 16),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: viewModel.isEditing
                  ? PomodoroTaskFieldsWidget(
                      taskTitleController: _taskTitleController,
                      taskDescriptionController: _taskDescriptionController,
                      viewModel: viewModel,
                    )
                  : const SizedBox(),
            ),
            Center(
              child: Text(
                "${viewModel.minuteLeft.toString().padLeft(2, '0')}:${viewModel.secondLeft.toString().padLeft(2, '0')}",
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: viewModel.isRunning ? null : viewModel.startTimer,
                  style: ElevatedButton.styleFrom(
                    disabledBackgroundColor: AppColors.cardBackground,
                    disabledForegroundColor: Colors.white,
                    foregroundColor: Colors.black,
                  ),
                  child: const Text("Start",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: viewModel.isRunning ? viewModel.pauseTimer : null,
                  style: ElevatedButton.styleFrom(
                    disabledBackgroundColor: AppColors.cardBackground,
                    disabledForegroundColor: Colors.white,
                    foregroundColor: Colors.black,
                  ),
                  child: const Text("Pause",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: viewModel.stopTimer,
                  style: ElevatedButton.styleFrom(
                    disabledBackgroundColor: AppColors.cardBackground,
                    disabledForegroundColor: Colors.white,
                    foregroundColor: Colors.black,
                  ),
                  child: const Text("Stop",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class PomodoroTaskFieldsWidget extends StatelessWidget {
  const PomodoroTaskFieldsWidget({
    super.key,
    required this.taskTitleController,
    required this.taskDescriptionController,
    required this.viewModel,
  });

  final TextEditingController taskTitleController;
  final TextEditingController taskDescriptionController;
  final PomodoroViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          style: const TextStyle(color: Colors.white, fontSize: 16),
          controller: taskTitleController,
          readOnly: !viewModel.isEditing,
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
        TextField(
          style: const TextStyle(color: Colors.white, fontSize: 16),
          controller: taskDescriptionController,
          readOnly: !viewModel.isEditing,
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
        Row(
          children: [
            Expanded(
              child: AppLabels.priorityLabel(
                text: 'Low',
                isSelected: viewModel.prioritySelected == PriorityEnums.low,
                onPressed: viewModel.isEditing
                    ? () {
                        viewModel.setprioritySelected(PriorityEnums.low);
                      }
                    : null,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: AppLabels.priorityLabel(
                text: 'Medium',
                isSelected: viewModel.prioritySelected == PriorityEnums.medium,
                onPressed: viewModel.isEditing
                    ? () {
                        viewModel.setprioritySelected(PriorityEnums.medium);
                      }
                    : null,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: AppLabels.priorityLabel(
                text: 'High',
                isSelected: viewModel.prioritySelected == PriorityEnums.high,
                onPressed: viewModel.isEditing
                    ? () {
                        viewModel.setprioritySelected(PriorityEnums.high);
                      }
                    : null,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Wrap(
          alignment: WrapAlignment.center,
          children: viewModel.task.timePiece
              .map(
                (timePiece) => GestureDetector(
                  onTap: () {
                    viewModel.completePomodoro(
                        viewModel.task.timePiece.indexOf(timePiece));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    child: CircleAvatar(
                      backgroundColor: timePiece.completed
                          ? AppColors.primary
                          : AppColors.cardBackground,
                      radius: 18,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 16),
        AppButtons.boldOutlinedButton(
            text: 'Delete Task',
            onPressed: () async {
              await viewModel.deleteTask(viewModel.task);
              Navigator.pop(context, true);
            },
            icon: Icons.remove),
        const SizedBox(height: 16),
        const Divider(
          color: AppColors.cardBackground,
          thickness: 3,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

class GetStartedPomodoroWidget extends StatelessWidget {
  const GetStartedPomodoroWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Lets get started!',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          'You can start the timer and focus on your task.',
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
