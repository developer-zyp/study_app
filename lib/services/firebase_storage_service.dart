import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

import '../firebase_ref/references.dart';

class FirebaseStorageService extends GetxService {
  Future<String?> getImage(String? imageName) async {
    if (imageName == null) {
      return null;
    }

    try {
      var urlRef =
          firebaseStorage.child('question_paper_images').child('${imageName.toLowerCase()}.png');
      var imageUrl = await urlRef.getDownloadURL();
      return imageUrl;
    } catch (e) {
      print('Unknown exception: $e');
      return null;
    }
  }
}
