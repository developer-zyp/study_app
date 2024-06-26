import 'package:flutter/material.dart';
import 'package:study_app/configs/themes/sub_theme_data.dart';

const Color primaryColorLight = Color(0xFF3ac3cb);
const Color secondaryColorLight = Color(0xFFf85187);
const Color mainTextColorLight = Color.fromARGB(255, 50, 50, 50);

class LightTheme with SubThemeData {
  buildLightTheme() {
    final ThemeData systemLightTheme = ThemeData.light();
    return systemLightTheme.copyWith(
        useMaterial3: false,
        primaryColor: primaryColorLight,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        iconTheme: getIconTheme(),
        textTheme: getTextThemes().apply(
          bodyColor: mainTextColorLight,
          displayColor: mainTextColorLight,
        ));
  }
}
