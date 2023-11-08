import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/configs/app_images.dart';
import 'package:study_app/controllers/question_papers/question_paper_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionpapercontroller = Get.find();
    return Scaffold(
      body: Obx(
        () => ListView.separated(
            itemBuilder: (context, index) {
              return ClipRRect(
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: FadeInImage(
                    placeholder: const AssetImage(AppImages.splashLogo),
                    image: NetworkImage(_questionpapercontroller.paperImages[index]),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 20);
            },
            itemCount: _questionpapercontroller.paperImages.length),
      ),
    );
  }
}
