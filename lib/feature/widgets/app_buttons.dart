import 'package:flutter/material.dart';
import 'package:listfull/core/res/colors.gen.dart';

class AppButtons {
  // 1. Primary Button
  static Widget thinOutlinedButton({
    required String text,
    required VoidCallback onPressed,
  }) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return const LinearGradient(
          colors: [AppColors.primary, AppColors.secondary],
        ).createShader(bounds);
      },
      blendMode: BlendMode.srcATop,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
          ),
          margin: const EdgeInsets.all(2), // Border width
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.add,
                color: Colors.white,
              ),
              const SizedBox(width: 8),
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 2. Secondary Button
  static Widget gradientBorderButton({
    required String text,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: const LinearGradient(
            colors: [
              AppColors.primary,
              AppColors.secondary
            ], // Default gradient colors
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.add,
              color: Colors.black,
              size: 30,
            ),
            const SizedBox(width: 8),
            Text(
              text,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  // 3. Tertiary Button
  static Widget boldOutlinedButton({
    required String text,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            width: 1,
          ),
        ),
        child: Stack(
          children: [
            // Gradient border effect
            Positioned.fill(
              child: ShaderMask(
                shaderCallback: (bounds) {
                  return const LinearGradient(
                    colors: [AppColors.primary, AppColors.secondary],
                  ).createShader(bounds);
                },
                blendMode: BlendMode.srcATop,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Colors
                          .white, // This color will be overridden by ShaderMask
                      width: 1,
                    ),
                  ),
                ),
              ),
            ),
            // Actual button content
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 30,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
