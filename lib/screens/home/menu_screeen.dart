import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/configs/app_colors.dart';
import 'package:study_app/controllers/zoom_drawer_controller.dart';

class MenuScreen extends GetView<MyZoomDrawerController> {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      decoration: BoxDecoration(gradient: AppColors.mainGradientLight),
      child: Theme(
        data: ThemeData(
            textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(primary: AppColors.onSurfaceTextColor))),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                  top: 40,
                  right: 80,
                  child: BackButton(
                    color: Colors.white,
                    onPressed: () {
                      controller.toggleDrawer();
                    },
                  )),
              // Text(
              //   'Hi there!',
              //   style: TextStyle(color: Colors.red),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
