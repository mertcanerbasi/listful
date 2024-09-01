import 'package:flutter/material.dart';
import 'package:listfull/core/res/colors.gen.dart';
import 'package:listfull/feature/widgets/progress_widget.dart';

class Last7DaysCompilationWidget extends StatelessWidget {
  final int last7daysCompletedTasks;
  final int last7daysTaskCount;
  const Last7DaysCompilationWidget({
    super.key,
    required this.last7daysCompletedTasks,
    required this.last7daysTaskCount,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 130,
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
                  colors: <Color>[AppColors.primary, AppColors.secondary],
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
              completedTasks: last7daysCompletedTasks,
              taskCount: last7daysTaskCount,
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              "%${((last7daysCompletedTasks / last7daysTaskCount) * 100).toStringAsFixed(0)}",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
