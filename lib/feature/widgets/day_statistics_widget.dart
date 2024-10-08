import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:listfull/core/res/colors.gen.dart';

class DayStatisticsWidget extends StatelessWidget {
  final String dayAbbreviation;
  final int completed;
  final int total;
  final DateTime currentDate;
  final bool isSelected; // New parameter to indicate selection

  const DayStatisticsWidget({
    super.key,
    required this.dayAbbreviation,
    required this.completed,
    required this.total,
    required this.currentDate,
    required this.isSelected, // Include it in the constructor
  });

  @override
  Widget build(BuildContext context) {
    String day = DateFormat('EEE').format(currentDate);
    return Container(
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.primary.withOpacity(0.1)
            : Colors.transparent, // Change background color based on selection
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Expanded(
            child: SizedBox(
              width: 3,
              child: Column(
                children: [
                  Expanded(
                    flex: (total == 0 ? 1 : total) - completed,
                    child: Container(
                      color: day == dayAbbreviation
                          ? AppColors.primary.withOpacity(0.2)
                          : Colors.grey.withOpacity(0.2),
                      height: 3,
                    ),
                  ),
                  completed == 0
                      ? const SizedBox()
                      : Expanded(
                          flex: completed,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: day == dayAbbreviation
                                  ? const LinearGradient(
                                      colors: [
                                        AppColors.primary,
                                        AppColors.secondary,
                                      ],
                                    )
                                  : const LinearGradient(
                                      colors: [
                                        Colors.grey,
                                        Colors.grey,
                                      ],
                                    ),
                            ),
                            height: 3,
                          ),
                        ),
                ],
              ),
            ),
          ),
          Text(
            dayAbbreviation[0],
            style: TextStyle(
              color: isSelected
                  ? AppColors.primary
                  : Colors.white, // Highlight text color if selected
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
