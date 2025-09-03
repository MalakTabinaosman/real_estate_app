
import 'package:flutter/material.dart';
import 'package:real_state_app/utils/constants/app_colors.dart';
import 'package:real_state_app/utils/theme/app_bar_theme.dart';
import 'package:real_state_app/utils/theme/check_box_theme.dart';
import 'package:real_state_app/utils/theme/elevated_button_theme.dart';
import 'package:real_state_app/utils/theme/text_feild_theme.dart';
import 'package:real_state_app/utils/theme/text_theme.dart';

class AppThemeData {
  AppThemeData._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppColors.lightPrimary,
    scaffoldBackgroundColor: AppColors.lightBackground,
    textTheme: AppTextTheme.lightTextTheme,
    inputDecorationTheme: TTextFieldTheme.lightInputDecorationTheme,
appBarTheme: TAppBarTheme.lightAppBarTheme,
    checkboxTheme: TCheckboxTheme.lightCheckBoxTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,



    
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness:Brightness.dark,
    primaryColor: AppColors.darkPrimary,
    scaffoldBackgroundColor: AppColors.darkBackground,
    textTheme: AppTextTheme.darkTextTheme,
    inputDecorationTheme: TTextFieldTheme.darkInputDecorationTheme,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    checkboxTheme: TCheckboxTheme.darkCheckBoxTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
  );
}
