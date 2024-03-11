import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class MyZoomDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();

  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }

  void signIn() {}

  void signOut() {}

  void goToWebsite() {}

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
