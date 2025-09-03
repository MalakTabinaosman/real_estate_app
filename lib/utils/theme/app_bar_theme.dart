
import 'package:flutter/material.dart';
import 'package:real_state_app/utils/theme/text_theme.dart';

class TAppBarTheme {
  TAppBarTheme._();
  static final lightAppBarTheme = AppBarTheme(
    elevation: 0,
    scrolledUnderElevation: 0,
    centerTitle: false,
    surfaceTintColor: Colors.transparent,
    backgroundColor: Colors.transparent,
    iconTheme: const IconThemeData(color: Colors.black,size: 24),
    actionsIconTheme: const IconThemeData(color: Colors.black,size: 24),
    titleTextStyle: AppTextTheme.lightTextTheme.headlineSmall

  );
  static final darkAppBarTheme = AppBarTheme(

    elevation: 0,
    scrolledUnderElevation: 0,
    centerTitle: false,
    surfaceTintColor: Colors.transparent,
    backgroundColor: Colors.transparent,
    iconTheme: const IconThemeData(color: Colors.white,size: 24),
    actionsIconTheme: const IconThemeData(color: Colors.white,size: 24),
    titleTextStyle: AppTextTheme.darkTextTheme.headlineSmall
  );
}
