import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:study_app/controllers/auth_controller.dart';
import 'package:study_app/utils/app_logger.dart';
import 'package:url_launcher/url_launcher.dart';

class MyZoomDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();
  Rxn<User?> user = Rxn();

  @override
  void onReady() {
    user.value = Get.find<AuthController>().getUser();
    super.onReady();
  }

  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }

  void signIn() {}

  void signOut() {
    Get.find<AuthController>().signOut();
  }

  void goToWebsite() {
    _launch(Uri.parse("https://www.google.com/"));
  }

  void goToEmail() {
    final Uri emailLaunchUri = Uri(scheme: 'mailto', path: 'mypc.zyp@gmail.com');
    _launch(emailLaunchUri);
  }

  Future<void> _launch(Uri emailLaunchUri) async {
    if (await canLaunchUrl(emailLaunchUri)) {
      throw 'could not launch ${emailLaunchUri}';
    }
  }
}
