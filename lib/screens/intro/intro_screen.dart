import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/widgets/circle_button.dart';

import '../../configs/app_colors.dart';
import '../../routes/route_names.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(gradient: AppColors.mainGradient()),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star, size: 60),
              SizedBox(height: 40),
              const Text(
                "This is a study app. You can use it as you want. If you understand how this work, you would be able to scale it. With this you will master in firebase backend an flutter front end.",
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.onSurfaceTextColor,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              CircleButton(
                onTap: () {
                  Get.offNamed(RouteNames.homeScreen);
                },
                child: Icon(Icons.arrow_forward, size: 35),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
