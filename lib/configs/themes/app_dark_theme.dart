import 'package:flutter/material.dart';
import 'package:study_app/configs/themes/sub_theme_data.dart';

const Color primaryColorDark = Color(0xFF2e3c62);
const Color secondaryColorDark = Color(0xFF99ace1);
const Color mainTextColorDark = Color.fromARGB(255, 250, 250, 250);

class DarkTheme with SubThemeData {
  buildDarkTheme() {
    final ThemeData systemDarkTheme = ThemeData.dark();
    return systemDarkTheme.copyWith(
        primaryColor: primaryColorDark.withOpacity(0.2),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        iconTheme: getIconTheme(),
        textTheme: getTextThemes().apply(
          bodyColor: mainTextColorDark,
          displayColor: mainTextColorDark,
        ));
  }
}
