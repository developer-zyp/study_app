import 'package:flutter/material.dart';
import 'package:study_app/configs/app_colors.dart';

class LoginScreen extends StatelessWidget {

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: AppColors.mainGradient(),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

          ],
        ),
      ),
    );
  }
}
