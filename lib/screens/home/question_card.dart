import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/configs/themes/app_text_style.dart';
import 'package:study_app/configs/themes/ui_parameters.dart';
import 'package:study_app/controllers/question_papers/question_paper_controller.dart';
import 'package:study_app/models/question_paper.dart';
import 'package:study_app/widgets/icon_text.dart';

import '../../configs/app_images.dart';

class QuestionCard extends GetView<QuestionPaperController> {
  final QuestionPaperModel model;

  const QuestionCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: UIParameters.cardBorderRadius,
        color: Theme.of(context).cardColor,
      ),
      child: InkWell(
        onTap: () {
          controller.navigateToQuestions(paperModel: model);
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      color: Theme.of(context).primaryColor.withOpacity(0.2),
                      child: SizedBox(
                          width: Get.width * 0.15,
                          height: Get.width * 0.15,
                          child: CachedNetworkImage(
                            imageUrl: model.imageUrl!,
                            placeholder: (context, url) {
                              return Container(
                                alignment: Alignment.center,
                                child: const CircularProgressIndicator(),
                              );
                            },
                            errorWidget: (context, url, error) {
                              return Image.asset(AppImages.splashLogo);
                            },
                          )
                          // FadeInImage(
                          //   placeholder: const AssetImage(AppImages.splashLogo),
                          //   image: NetworkImage(questionPaperController.paperImages[index]),
                          // ),
                          ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.title ?? '',
                          style: cardTitles(context),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(model.description ?? ''),
                        ),
                        Row(
                          children: [
                            IconText(
                                icon: Icon(
                                  Icons.help_outline_sharp,
                                  color: Get.isDarkMode ? Colors.white : Theme.of(context).primaryColor,
                                ),
                                text: Text(
                                  '${model.title}',
                                  style: cardDetails,
                                )),
                            const SizedBox(
                              width: 25,
                            ),
                            IconText(
                                icon: Icon(
                                  Icons.help_outline_sharp,
                                  color: Get.isDarkMode ? Colors.white : Theme.of(context).primaryColor,
                                ),
                                text: Text(
                                  model.timeInMins(),
                                  style: cardDetails,
                                )),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                  right: -10,
                  bottom: -10,
                  child: GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(cardBorderRadius),
                          bottomRight: Radius.circular(cardBorderRadius),
                        ),
                        color: Theme.of(context).primaryColor,
                      ),
                      child: const Icon(
                        Icons.wine_bar,
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
