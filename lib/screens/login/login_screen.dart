import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:study_app/configs/app_colors.dart';
import 'package:study_app/configs/app_icons.dart';
import 'package:study_app/configs/app_images.dart';
import 'package:study_app/configs/themes/app_light_theme.dart';
import 'package:study_app/configs/themes/ui_parameters.dart';
import 'package:study_app/controllers/auth_controller.dart';
import 'package:study_app/widgets/main_button.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: UIParameters.appScreenPadding,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: AppColors.mainGradient(),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.splashLogo,
              width: 160,
              height: 160,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 40.0),
              child: Text(
                "This is a study app. You can study biology, chemistry, maths and physics with quiz. This app contains login features like google sign-in.",
                style: TextStyle(
                  color: AppColors.onSurfaceTextColor,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            MainButton(
              onTap: () {
                controller.signInWithGoogle();
              },
              title: 'Sign In with Google',
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    bottom: 0,
                    child: SvgPicture.asset(AppIcons.google),
                  ),
                  const Center(
                    child: Text('Sign In With Google'),
                  ),
                ],
              ),
            ),
            // ElevatedButton.icon(
            //   onPressed: () {},
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Colors.white,
            //     textStyle: const TextStyle(
            //       color: Colors.red,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            //   icon: SvgPicture.asset(
            //     AppIcons.google,
            //     height: 10,
            //   ),
            //   label: const Text('Sign In With Google', style: TextStyle(color: Colors.red)),
            // ),
            // ElevatedButton(
            //   onPressed: () {},
            //   style: ElevatedButton.styleFrom(elevation: 12.0, textStyle: const TextStyle(color: Colors.red)),
            //   child: const Text('Elevated Button'),
            // ),
          ],
        ),
      ),
    );
  }
}
