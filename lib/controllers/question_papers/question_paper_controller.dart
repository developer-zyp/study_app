import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:study_app/firebase_ref/references.dart';
import 'package:study_app/models/question_paper.dart';
import 'package:study_app/services/firebase_storage_service.dart';

class QuestionPaperController extends GetxController {
  final paperImages = <String>[].obs;
  final allPapers = <QuestionPaperModel>[].obs;

  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  getAllPapers() async {
    List<String> imgNames = ["biology", "chemistry", "maths", "physics"];
    try {
      QuerySnapshot<Map<String, dynamic>> data = await questionPaperRF.get();
      final paperList = data.docs
          .map((e) => QuestionPaperModel.fromSnapshot(e))
          .toList();
      // allPapers.addAll(paperList);

      for (var paper in paperList) {
        final imgUrl = await Get.find<FirebaseStorageService>().getImage(paper.title);
        paper.imageUrl = imgUrl;
      }

      allPapers.addAll(paperList);
    } catch (e) {
      print('Unknown exception: $e');
    }
  }
}
