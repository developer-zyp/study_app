import 'package:flutter/material.dart';
import 'package:study_app/configs/themes/app_dark_theme.dart';
import 'package:study_app/configs/themes/app_light_theme.dart';
import 'package:study_app/configs/themes/ui_parameters.dart';

class AppColors {
  static const Color onSurfaceTextColor = Colors.white;

  static const mainGradientLight = LinearGradient(
    colors: [
      primaryColorLight,
      secondaryColorLight,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const mainGradientDark = LinearGradient(
    colors: [
      primaryColorDark,
      secondaryColorDark,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static LinearGradient mainGradient() =>
      UIParameters.isDarkMode() ? mainGradientDark : mainGradientLight;
}

Color scaffoldColor(BuildContext context) =>
    (UIParameters.isDarkMode() ? Colors.indigo[900] : Colors.grey[100]) ?? const Color(0xFFF5F5F5);
