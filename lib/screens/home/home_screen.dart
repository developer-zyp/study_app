import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:study_app/configs/app_colors.dart';
import 'package:study_app/configs/app_icons.dart';
import 'package:study_app/configs/app_images.dart';
import 'package:study_app/configs/themes/app_text_style.dart';
import 'package:study_app/configs/themes/ui_parameters.dart';
import 'package:study_app/controllers/question_papers/question_paper_controller.dart';
import 'package:study_app/controllers/zoom_drawer_controller.dart';
import 'package:study_app/screens/home/menu_screeen.dart';
import 'package:study_app/screens/home/question_card.dart';
import 'package:study_app/widgets/circle_button.dart';

import '../../widgets/content_area.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionPaperController questionPaperController = Get.find();
    MyZoomDrawerController zoomDrawerController = Get.find();
    return Scaffold(
      body: ZoomDrawer(
        controller: zoomDrawerController.zoomDrawerController,
        angle: 0.0,
        style: DrawerStyle.defaultStyle,
        showShadow: false,
        clipMainScreen: false,
        moveMenuScreen: false,
        menuScreenWidth: MediaQuery.of(context).size.width,
        menuBackgroundColor: Colors.white.withOpacity(0.5),
        menuScreen: const MenuScreen(),
        slideWidth: Get.width * 0.6,
        mainScreenTapClose: true,
        mainScreen: Container(
          decoration: BoxDecoration(gradient: AppColors.mainGradient()),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(appScreenPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        constraints: const BoxConstraints(),
                        icon: const Icon(
                          AppIcons.menuLeft,
                        ),
                        onPressed: zoomDrawerController.toggleDrawer,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Row(
                          children: [
                            const Icon(AppIcons.peace),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Hello friend',
                              style: cardDetails.copyWith(color: AppColors.onSurfaceTextColor),
                            )
                          ],
                        ),
                      ),
                      Text(
                        'What do you want to learn today?',
                        style: headerText,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: ContentArea(
                      addPadding: false,
                      child: Obx(
                        () => ListView.separated(
                            padding: const EdgeInsets.all(20),
                            itemBuilder: (context, index) {
                              return QuestionCard(model: questionPaperController.allPapers[index]);
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(height: 20);
                            },
                            itemCount: questionPaperController.allPapers.length),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
