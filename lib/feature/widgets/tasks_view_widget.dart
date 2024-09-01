import 'package:flutter/material.dart';
import 'package:listfull/core/extensions/string_extensions.dart';
import 'package:listfull/core/res/colors.gen.dart';
import 'package:listfull/feature/data/model/task.dart';
import 'package:listfull/feature/router/app_router.routes.dart';
import 'package:listfull/feature/widgets/app_labels.dart';

class TasksViewWidget extends StatelessWidget {
  final TaskList? taskList;
  final VoidCallback onReturnTask;
  const TasksViewWidget({super.key, this.taskList, required this.onReturnTask});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemCount: taskList?.tasks?.length ?? 0,
      itemBuilder: (context, index) {
        final task = taskList?.tasks?[index];
        return Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  AppLabels.priorityLabel(
                    text: task!.priority.name.capitalizeFirstLetter(),
                    isSelected: true,
                    onPressed: () {},
                  ),
                  const Spacer(),
                  AppLabels.categoryLabel(
                    text: "${task.timePiece.where(
                          (element) => element.completed,
                        ).length}/${task.timePiece.length}",
                    isSelected: true,
                    color: AppColors.secondary,
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ListTile(
                contentPadding: EdgeInsets.zero,
                onTap: () {
                  PomodoroRoute(task: task).push(context).then((value) {
                    if (true) {
                      onReturnTask();
                    }
                  });
                },
                title: Text(task.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    )),
                subtitle: Text(
                  task.description,
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
                trailing: task.completed
                    ? const Icon(
                        Icons.check,
                        color: AppColors.primary,
                        size: 25,
                      )
                    : const Icon(
                        Icons.play_arrow,
                        color: AppColors.primary,
                        size: 25,
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
