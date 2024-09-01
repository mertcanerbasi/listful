import 'package:flutter/material.dart';
import 'package:listfull/core/res/colors.gen.dart';
import 'package:listfull/feature/widgets/progress_widget.dart';

class TotalTasksWidget extends StatelessWidget {
  final int completedTasks;
  final int taskCount;
  const TotalTasksWidget({
    super.key,
    required this.completedTasks,
    required this.taskCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
      ),
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
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                "$completedTasks/$taskCount",
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
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ProgressWidget(
                  completedTasks: completedTasks, taskCount: taskCount)),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
