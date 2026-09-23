import 'package:evently/common/app_text_styles.dart';
import 'package:evently/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    hintColor: AppColors.lightSecTextColor,
    cardColor: AppColors.mainColors,
    hoverColor: AppColors.lightSecTextColor,
    shadowColor: AppColors.lightBgColor,
    scaffoldBackgroundColor: AppColors.lightBgColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightBgColor,
      foregroundColor: AppColors.mainColors,
      centerTitle: true,
      elevation: 0,
      titleTextStyle: AppTextStyles.styleS22W400(color: AppColors.mainColors),
      iconTheme: IconThemeData(color: AppColors.mainColors),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.mainColors,
      brightness: Brightness.light,
      primary: AppColors.mainColors,
    ),
    textTheme: TextTheme(
      displayLarge: AppTextStyles.styleS22W700(),
      displayMedium: AppTextStyles.styleS20W700(),
      displaySmall: AppTextStyles.styleS18W700(),

      headlineLarge: AppTextStyles.styleS22W600(),
      headlineMedium: AppTextStyles.styleS20W600(),
      headlineSmall: AppTextStyles.styleS18W600(),

      titleLarge: AppTextStyles.styleS22W500(),
      titleMedium: AppTextStyles.styleS20W500(),
      titleSmall: AppTextStyles.styleS18W500(),

      bodyLarge: AppTextStyles.styleS22W400(),
      bodyMedium: AppTextStyles.styleS20W400(),
      bodySmall: AppTextStyles.styleS18W400(),

      labelLarge: AppTextStyles.styleS18W400(),
      labelMedium: AppTextStyles.styleS16W400(),
      labelSmall: AppTextStyles.styleS14W400(),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    cardColor: AppColors.darkBgColor,
    shadowColor: AppColors.mainColors,

    hintColor: AppColors.mainColors,
    hoverColor: AppColors.darkTextColor,

    scaffoldBackgroundColor: AppColors.darkBgColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkBgColor,
      foregroundColor: AppColors.mainColors,
      elevation: 0,
      titleTextStyle: AppTextStyles.styleS22W400(color: AppColors.mainColors),
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.mainColors),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.mainColors,
      primary: AppColors.mainColors,
      brightness: Brightness.dark,
    ),

    textTheme: TextTheme(
      displayLarge: AppTextStyles.styleS22W700(color: AppColors.darkTextColor),
      displayMedium: AppTextStyles.styleS20W700(color: AppColors.darkTextColor),
      displaySmall: AppTextStyles.styleS18W700(color: AppColors.darkTextColor),

      headlineLarge: AppTextStyles.styleS22W600(color: AppColors.darkTextColor),
      headlineMedium: AppTextStyles.styleS20W600(color: AppColors.darkTextColor),
      headlineSmall: AppTextStyles.styleS18W600(color: AppColors.darkTextColor),

      titleLarge: AppTextStyles.styleS22W500(color: AppColors.darkTextColor),
      titleMedium: AppTextStyles.styleS20W500(color: AppColors.darkTextColor),
      titleSmall: AppTextStyles.styleS18W500(color: AppColors.darkTextColor),

      bodyLarge: AppTextStyles.styleS22W400(color: AppColors.darkTextColor),
      bodyMedium: AppTextStyles.styleS20W400(color: AppColors.darkTextColor),
      bodySmall: AppTextStyles.styleS18W400(color: AppColors.darkTextColor),

      labelLarge: AppTextStyles.styleS18W400(color: AppColors.darkTextColor),
      labelMedium: AppTextStyles.styleS16W400(color: AppColors.darkTextColor),
      labelSmall: AppTextStyles.styleS14W400(color: AppColors.darkTextColor),
    ),
  );
}
