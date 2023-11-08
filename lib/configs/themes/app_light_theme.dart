import 'package:flutter/material.dart';
import 'package:study_app/configs/themes/sub_theme_data.dart';

const Color colorPrimaryLight = Color(0xFF3ac3cb);
const Color colorSecondaryLight = Color(0xFFf85187);
const Color mainTextColorLight = Color.fromARGB(255, 50, 50, 50);

class LightTheme with SubThemeData {
  buildLightTheme() {
    final ThemeData systemLightTheme = ThemeData.light();
    return systemLightTheme.copyWith(
        iconTheme: getIconTheme(),
        textTheme: getTextThemes().apply(
          bodyColor: mainTextColorLight,
          displayColor: mainTextColorLight,
        ));
  }
}
