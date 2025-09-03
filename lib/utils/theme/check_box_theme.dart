import 'package:flutter/material.dart';
import 'package:real_state_app/utils/constants/app_colors.dart';

class TCheckboxTheme {
  TCheckboxTheme._();

  static final CheckboxThemeData lightCheckBoxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: MaterialStateProperty.resolveWith((states){

      if (states.contains(MaterialState.selected)) {
        return AppColors.white;
      }else {
        return AppColors.dark;
      }
    }),
    fillColor: MaterialStateProperty.resolveWith((states) {
       if (states.contains(MaterialState.selected)) {
        return AppColors.lightPrimary;
      }else {
        return Colors.transparent;
      }
    })
  );
  static final CheckboxThemeData darkCheckBoxTheme = CheckboxThemeData(

    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return AppColors.white;
      } else {
        return AppColors.dark;
      }
    }),
    fillColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return AppColors.darkPrimary;
      } else {
        return Colors.transparent;
      }
    })
  );
}
