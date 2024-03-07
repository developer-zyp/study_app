import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

class MyZoomDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();

  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }

  void signIn(){

  }

  void signOut(){

  }

  void goToWebsite(){

  }

  void goToEmail(){
    final emailUri = Uri(scheme: 'mailto',path: 'mypc.zyp@gmail.com');

  }
}
