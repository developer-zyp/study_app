import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:study_app/firebase_ref/loading_status.dart';
import 'package:study_app/firebase_ref/references.dart';
import 'package:study_app/models/question_paper.dart';

class DataUploader extends GetxController {
  final loadingStatus = LoadingStatus.loading.obs;

  @override
  void onReady() {
    uploadData();
    super.onReady();
  }

  Future<void> uploadData() async {
    loadingStatus.value = LoadingStatus.loading;

    final fireStore = FirebaseFirestore.instance;
    final manifestContent =
        await DefaultAssetBundle.of(Get.context!).loadString("AssetManifest.json");
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    //load json file from assets folder
    final papersInAssets = manifestMap.keys
        .where((element) => element.startsWith("assets/DB/paper") && element.contains(".json"))
        .toList();
    // print(papersInAssets);
    List<QuestionPaperModel> questionPapers = [];
    for (var paper in papersInAssets) {
      String paperContent = await rootBundle.loadString(paper);
      // print(paperContent);
      questionPapers.add(QuestionPaperModel.fromJson(jsonDecode(paperContent)));
    }
    // print("Item Length = ${questionPapers.length}");
    // print("Item Name = ${questionPapers[0].description}");

    var batch = fireStore.batch();

    for (var paper in questionPapers) {
      batch.set(questionPaperRF.doc(paper.id), {
        "title": paper.title,
        "image_url": paper.imageUrl,
        "description": paper.description,
        "time_seconds": paper.timeSeconds,
        "questionCount": paper.questions == null ? 0 : paper.questions?.length
      });

      for (var question in paper.questions!) {
        final questionPath = questionRF(paperId: paper.id, questionId: question.id);
        batch.set(questionPath,
            {"question": question.question, "correct_answer": question.correctAnswer});

        for (var answer in question.answers) {
          batch.set(questionPath.collection("answers").doc(answer.identifier),
              {"identifier": answer.identifier, "Answer": answer.answer});
        }
      }
    }

    batch.commit();
    loadingStatus.value = LoadingStatus.complete;
  }
}
