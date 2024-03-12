import 'package:get/get.dart';
import 'package:study_app/controllers/question_papers/question_paper_controller.dart';
import 'package:study_app/routes/route_names.dart';
import 'package:study_app/screens/home/home_screen.dart';
import 'package:study_app/screens/intro/intro_screen.dart';
import 'package:study_app/screens/login/login_screen.dart';
import 'package:study_app/screens/splash/splash_screen.dart';

import '../controllers/zoom_drawer_controller.dart';
import '../services/firebase_storage_service.dart';

class AppRoutes {
  static List<GetPage> routes = [
    GetPage(name: RouteNames.splashScreen, page: () => SplashScreen()),
    GetPage(name: RouteNames.introScreen, page: () => IntroScreen()),
    GetPage(
        name: RouteNames.homeScreen,
        page: () => const HomeScreen(),
        binding: BindingsBuilder(() {
          Get.put(FirebaseStorageService());
          Get.put(QuestionPaperController());
          Get.put(MyZoomDrawerController());
        })),
    GetPage(name: RouteNames.loginScreen, page: () => LoginScreen()),
  ];
}
