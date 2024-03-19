import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/configs/app_colors.dart';
import 'package:study_app/configs/themes/ui_parameters.dart';
import 'package:study_app/controllers/zoom_drawer_controller.dart';

class MenuScreen extends GetView<MyZoomDrawerController> {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UIParameters.appScreenPadding,
      width: double.infinity,
      decoration: BoxDecoration(gradient: AppColors.mainGradientLight),
      child: Theme(
        data: ThemeData(
            textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(foregroundColor: AppColors.onSurfaceTextColor))),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                  top: 0,
                  right: 0,
                  child: BackButton(
                    color: Colors.white,
                    onPressed: () {
                      controller.toggleDrawer();
                    },
                  )),
              Column(
                children: [
                  Obx(
                    () => controller.user.value == null
                        ? const SizedBox()
                        : Text(
                            controller.user.value?.displayName ?? "Login User",
                            style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 18,
                              color: AppColors.onSurfaceTextColor,
                            ),
                          ),
                  ),
                  _DrawerButton(iconData: Icons.web, label: "Website", onTap: controller.goToWebsite),
                  _DrawerButton(iconData: Icons.email, label: "Email", onTap: controller.goToEmail),
                  _DrawerButton(iconData: Icons.facebook, label: "Facebook", onTap: controller.goToWebsite),
                  _DrawerButton(iconData: Icons.logout, label: "Logout", onTap: controller.signOut),
                ],
              ),
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

class _DrawerButton extends StatelessWidget {
  const _DrawerButton({super.key, required this.iconData, required this.label, required this.onTap});

  final IconData iconData;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: onTap,
        icon: Icon(
          iconData,
          size: 15,
        ),
        label: Text(label));
  }
}
