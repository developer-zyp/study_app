import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study_app/configs/themes/app_dark_theme.dart';
import 'package:study_app/configs/themes/app_light_theme.dart';
import 'package:study_app/configs/themes/ui_parameters.dart';

class AppColors {
  static const Color onSurfaceTextColor = Colors.white;

  static const mainGradientLight = LinearGradient(
    colors: [
      colorPrimaryLight,
      colorSecondaryLight,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const mainGradientDark = LinearGradient(
    colors: [
      colorPrimaryDark,
      colorSecondaryDark,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static LinearGradient mainGradient(BuildContext context) =>
      UIParameters.isDarkMode(context) ? mainGradientDark : mainGradientLight;
}
