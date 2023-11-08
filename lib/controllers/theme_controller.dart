import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/configs/themes/app_dark_theme.dart';
import 'package:study_app/configs/themes/app_light_theme.dart';

class ThemeController extends GetxController {
  late ThemeData _lightTheme;
  late ThemeData _darkTheme;

  ThemeData get lightTheme => _lightTheme;

  ThemeData get darkTheme => _darkTheme;

  @override
  void onInit() {
    initThemeData();
    super.onInit();
  }

  void initThemeData() {
    _lightTheme = LightTheme().buildLightTheme();
    _darkTheme = DarkTheme().buildDarkTheme();
  }
}
