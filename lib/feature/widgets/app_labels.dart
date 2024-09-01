import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:listfull/core/res/colors.gen.dart';

class AppLabels {
  static Widget priorityLabel({
    required String text,
    required bool isSelected,
    required VoidCallback onPressed,
  }) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return isSelected
            ? const LinearGradient(
                colors: [AppColors.primary, AppColors.secondary],
              ).createShader(bounds)
            : const LinearGradient(
                colors: [Colors.transparent, Colors.transparent],
              ).createShader(bounds);
      },
      blendMode: BlendMode.srcATop,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: 100,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: isSelected ? AppColors.primary : Colors.grey,
              width: 2,
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Widget dateLabel({
    required DateTime date,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: Colors.grey,
            width: 2,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.calendar_today,
              color: Colors.white,
            ),
            const SizedBox(width: 8),
            Text(
              formatDate(date),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String formatDate(DateTime date) {
  // Format the DateTime object to the desired format
  String formattedDate = DateFormat('EEE, d').format(date);

  return formattedDate;
}
