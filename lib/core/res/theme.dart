import 'package:listfull/core/res/colors.gen.dart';
import 'package:listfull/core/res/icons.dart';
import 'package:flutter/material.dart';

class LightTheme extends AppTheme {
  @override
  ColorScheme get colorScheme => const ColorScheme.light(
      primary: AppColors.primary, outlineVariant: Colors.grey);
}

class DarkTheme extends AppTheme {
  @override
  ColorScheme get colorScheme => const ColorScheme.dark(
      secondary: AppColors.primary,
      primary: AppColors.primary,
      outlineVariant: Colors.grey);
}

class AppTheme {
  ColorScheme colorScheme = const ColorScheme.light(
      primary: AppColors.primary, outlineVariant: Colors.grey);

  ThemeData theme() {
    return ThemeData(
        useMaterial3: true,
        colorScheme: colorScheme,
        scaffoldBackgroundColor: AppColors.background,
        fontFamily: "Inter",
        appBarTheme: const AppBarTheme(
          centerTitle: false,
          scrolledUnderElevation: 0,
          backgroundColor: AppColors.background,
        ),
        dividerTheme: DividerThemeData(
          space: 1,
          color: colorScheme.onSurface.withOpacity(0.1),
        ),
        cardTheme: CardTheme(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              side: BorderSide(
                  color: colorScheme.onSurface.withOpacity(0.8), width: 6)),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        listTileTheme: ListTileThemeData(
          iconColor: Colors.white,
          titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          subtitleTextStyle: const TextStyle(
            color: Colors.white,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        actionIconTheme: ActionIconThemeData(
          drawerButtonIconBuilder: (context) {
            return const Icon(AppIcons.menu);
          },
          endDrawerButtonIconBuilder: (context) {
            return const Icon(AppIcons.menu);
          },
          backButtonIconBuilder: (context) {
            return const Icon(AppIcons.chevronLeft);
          },
          closeButtonIconBuilder: (context) {
            return const Icon(AppIcons.xmark);
          },
        ),
        iconTheme: IconThemeData(
            color: colorScheme.onSurface.withOpacity(
              0.5,
            ),
            size: 18),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: AppColors.primary),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
                textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ))),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: colorScheme.onPrimary,
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                ))),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(fontSize: 12),
          unselectedLabelStyle: TextStyle(
            fontSize: 12,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          focusedBorder: inputBorder,
          border: inputBorder,
          filled: true,
          alignLabelWithHint: true,
          fillColor: colorScheme.onPrimary,
          enabledBorder: inputBorder,
          disabledBorder: inputBorder,
        ));
  }

  static var inputBorder = OutlineInputBorder(
    gapPadding: 4,
    borderSide: const BorderSide(color: Colors.grey),
    borderRadius: BorderRadius.circular(8),
  );
}
