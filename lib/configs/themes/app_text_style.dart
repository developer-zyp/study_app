import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/configs/app_colors.dart';
import 'package:study_app/configs/themes/ui_parameters.dart';

TextStyle cardTitles(context) => TextStyle(
      color: UIParameters.isDarkMode()
          ? Theme.of(context).textTheme.bodyLarge!.color
          : Theme.of(context).primaryColor,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );

TextStyle cardDetails = const TextStyle(fontSize: 12);

TextStyle headerText = const TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.w700,
  color: AppColors.onSurfaceTextColor,
);
