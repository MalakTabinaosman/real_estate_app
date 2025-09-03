
import 'package:flutter/material.dart';
import 'package:real_state_app/utils/constants/app_colors.dart';
import 'package:real_state_app/utils/theme/text_theme.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 1,
      backgroundColor: AppColors.lightPrimary,
      foregroundColor: Colors.white,
      disabledBackgroundColor: AppColors.lightPrimary.withOpacity(0.5),
      disabledForegroundColor: Colors.white.withOpacity(0.5),
      side: const BorderSide(color: AppColors.lightPrimary),
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      textStyle: AppTextTheme.lightTextTheme.titleLarge,
    ),
  );
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(

    style: ElevatedButton.styleFrom(
      elevation: 1,
      backgroundColor: AppColors.darkPrimary,
      foregroundColor: Colors.white,
      disabledBackgroundColor: AppColors.darkPrimary.withOpacity(0.5),
      disabledForegroundColor: Colors.white.withOpacity(0.5),
      side: const BorderSide(color: AppColors.darkPrimary),
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      textStyle: AppTextTheme.darkTextTheme.titleLarge,
    ),
  );
}
