import 'package:get/get.dart';
import 'package:study_app/routes/route_names.dart';

class AuthController extends GetxController {
  @override
  void onReady() {
    initAuth();
    super.onReady();
  }

  void initAuth() async {
    await Future.delayed(const Duration(seconds: 2));
    navigateToIntroScreen();
  }

  void navigateToIntroScreen() {
    Get.offNamed(RouteNames.introScreen);
  }
}
