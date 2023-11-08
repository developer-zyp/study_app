import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:study_app/configs/app_colors.dart';

mixin SubThemeData {
  TextTheme getTextThemes() {
    return GoogleFonts.quicksandTextTheme(const TextTheme(
      bodyLarge: TextStyle(fontWeight: FontWeight.w400),
      bodyMedium: TextStyle(fontWeight: FontWeight.w400),
    ));
  }

  IconThemeData getIconTheme() {
    return const IconThemeData(color: AppColors.onSurfaceTextColor, size: 16);
  }
}
