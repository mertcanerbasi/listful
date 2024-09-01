import 'package:flutter/material.dart';
import 'package:listfull/core/res/colors.gen.dart';

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({
    super.key,
    required this.completedTasks,
    required this.taskCount,
  });

  final int completedTasks;
  final int taskCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 3,
      child: Row(
        children: [
          completedTasks == 0
              ? const SizedBox()
              : Expanded(
                  flex: completedTasks,
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
            flex: taskCount - completedTasks,
            child: Container(
              color: AppColors.primary.withOpacity(0.2),
              height: 3,
            ),
          ),
        ],
      ),
    );
  }
}
