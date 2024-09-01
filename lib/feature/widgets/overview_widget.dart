import 'package:flutter/material.dart';
import 'package:listfull/core/res/colors.gen.dart';
import 'package:listfull/core/res/constants.dart';
import 'package:listfull/feature/page/home/home_vm.dart';
import 'package:listfull/feature/widgets/day_statistics_widget.dart';
import 'package:listfull/feature/widgets/days_list_widget.dart';
import 'package:listfull/feature/widgets/last_7_days_compilation_widget.dart';
import 'package:listfull/feature/widgets/total_tasks_widget.dart';

class OverViewWidget extends StatelessWidget {
  const OverViewWidget({
    super.key,
    required this.viewModel,
  });

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DaysList(
          viewModel: viewModel,
        ),
        const SizedBox(
          height: 16,
        ),
        TotalTasksWidget(
          completedTasks: viewModel.last7daysCompletedTasks,
          taskCount: viewModel.last7daysTaskCount,
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
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: AppConstants.days.length,
                        itemBuilder: (context, index) {
                          return DayStatisticsWidget(
                            dayAbbreviation: AppConstants.days[index],
                            completed: viewModel.getCompletedTasksCount(
                                viewModel.currentDate
                                    .subtract(Duration(days: (6 - index)))),
                            total: viewModel.getTaskCount(viewModel.currentDate
                                .subtract(Duration(days: (6 - index)))),
                            currentDate: viewModel.currentDate,
                          );
                        },
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
