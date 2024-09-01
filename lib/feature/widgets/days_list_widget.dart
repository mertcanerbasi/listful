import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:listfull/core/res/colors.gen.dart';
import 'package:listfull/feature/page/home/home_vm.dart';

class DaysList extends StatelessWidget {
  final HomeViewModel viewModel;

  const DaysList({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    // Get a list of DateTime objects for today and the previous 6 days
    List<DateTime> lastSevenDays = List.generate(7, (index) {
      return DateTime.now().subtract(Duration(days: 6 - index));
    });

    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemCount: lastSevenDays.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          // Get the day and date from the DateTime object
          String day = DateFormat('EEE').format(lastSevenDays[index]);
          String date = DateFormat('d').format(lastSevenDays[index]);

          // Check if the current date is the selected date
          bool isSelected =
              lastSevenDays[index].day == viewModel.currentDate.day &&
                  lastSevenDays[index].month == viewModel.currentDate.month &&
                  lastSevenDays[index].year == viewModel.currentDate.year;

          return GestureDetector(
            onTap: () {
              viewModel.setcurrentDate(lastSevenDays[index]);
            },
            child: Container(
              height: 80,
              width: 50,
              decoration: BoxDecoration(
                color:
                    isSelected ? AppColors.cardBackground : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    day,
                    style: TextStyle(
                      color: isSelected
                          ? Colors.white
                          : Colors.grey, // Different color for selected date
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.normal, // Bold if selected
                    ),
                  ),
                  Text(
                    date,
                    style: TextStyle(
                      color: isSelected
                          ? AppColors.primary
                          : Colors.grey, // Different color for selected date
                      fontWeight: FontWeight.bold, // Always bold for the date
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
