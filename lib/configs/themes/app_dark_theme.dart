import 'package:flutter/material.dart';
import 'package:study_app/configs/themes/sub_theme_data.dart';

const Color colorPrimaryDark = Color(0xFF2e3c62);
const Color colorSecondaryDark = Color(0xFF99ace1);
const Color mainTextColorDark = Color.fromARGB(255, 250, 250, 250);

class DarkTheme with SubThemeData {
  buildDarkTheme() {
    final ThemeData systemDarkTheme = ThemeData.dark();
    return systemDarkTheme.copyWith(
        iconTheme: getIconTheme(),
        textTheme: getTextThemes().apply(
          bodyColor: mainTextColorDark,
          displayColor: mainTextColorDark,
        ));
  }
}
