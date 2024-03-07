import 'package:flutter/material.dart';
import 'package:get/get.dart';

const double _appScreenPadding = 25.0;
const double _cardBorderRadius = 10.0;

double get appScreenPadding => _appScreenPadding;

double get cardBorderRadius => _cardBorderRadius;

class UIParameters {
  static EdgeInsets get appScreenPadding => const EdgeInsets.all(_appScreenPadding);

  static BorderRadius get cardBorderRadius => BorderRadius.circular(_cardBorderRadius);

  static bool isDarkMode() {
    return Get.isDarkMode;
  }
}
