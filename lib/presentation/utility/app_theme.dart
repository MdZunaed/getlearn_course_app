import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
    fontFamily: "Poppins",
    appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primaryColor,
        titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
        iconTheme: IconThemeData(size: 22, color: Colors.white)),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
          fontFamily: "Poppins-bold", fontWeight: FontWeight.bold, fontSize: 24, color: AppColors.textColor),
      titleLarge: TextStyle(
          fontFamily: "Poppins", fontWeight: FontWeight.w600, fontSize: 18, color: AppColors.titleColor),
      titleMedium: TextStyle(
          fontFamily: "Poppins", fontWeight: FontWeight.w600, fontSize: 16, color: AppColors.titleColor),
      titleSmall: TextStyle(
          fontFamily: "Poppins", fontWeight: FontWeight.w500, fontSize: 14, color: AppColors.titleColor),
      bodySmall: TextStyle(
          fontFamily: "Poppins", fontWeight: FontWeight.w500, fontSize: 13, color: AppColors.textColor),
      bodyMedium: TextStyle(
          fontFamily: "Poppins", fontWeight: FontWeight.w500, fontSize: 14, color: AppColors.textColor),
      bodyLarge: TextStyle(
          fontFamily: "Poppins", fontWeight: FontWeight.w500, fontSize: 16, color: AppColors.textColor),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            backgroundColor: AppColors.primaryColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)))),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            textStyle:
                const TextStyle(color: AppColors.primaryColor, fontSize: 14, fontWeight: FontWeight.w500),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            backgroundColor: AppColors.cardColor,
            side: const BorderSide(width: 1.2, color: AppColors.primaryColor))),
    expansionTileTheme: ExpansionTileThemeData(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      collapsedBackgroundColor: Colors.white,
      collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    listTileTheme: const ListTileThemeData(
        iconColor: AppColors.primaryColor,
        titleTextStyle: TextStyle(
            fontFamily: "Poppins", fontWeight: FontWeight.w600, fontSize: 15, color: AppColors.textColor)),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      hintStyle: const TextStyle(color: Colors.grey),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(12)),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primaryColor, width: 2),
          borderRadius: BorderRadius.circular(12)),
      errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red), borderRadius: BorderRadius.circular(12)),
    ),
  );
}
