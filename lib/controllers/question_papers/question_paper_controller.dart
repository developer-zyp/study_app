import 'package:get/get.dart';
import 'package:study_app/services/firebase_storage_service.dart';

class QuestionPaperController extends GetxController {
  final paperImages = <String>[].obs;

  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  getAllPapers() async {
    List<String> imgNames = ["biology", "chemistry", "maths", "physics"];
    try {
      for (var img in imgNames) {
        final imgUrl = await Get.find<FirebaseStorageService>().getImage(img);
        paperImages.add(imgUrl!);
      }
    } catch (e) {
      print('Unknown exception: $e');
    }
  }
}
