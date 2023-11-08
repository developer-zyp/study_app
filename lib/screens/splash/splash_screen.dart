import 'package:flutter/material.dart';
import 'package:study_app/configs/app_colors.dart';
import 'package:study_app/configs/app_images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(gradient: AppColors.mainGradient(context)),
        child: Image.asset(
          AppImages.splashLogo,
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
