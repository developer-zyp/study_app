import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:study_app/firebase_ref/references.dart';
import 'package:study_app/routes/route_names.dart';
import 'package:study_app/utils/app_logger.dart';

class AuthController extends GetxController {
  @override
  void onReady() {
    initAuth();
    super.onReady();
  }

  late FirebaseAuth _firebaseAuth;
  final _user = Rxn<User>();

  void initAuth() async {
    await Future.delayed(const Duration(seconds: 2));
    _firebaseAuth = FirebaseAuth.instance;

    _firebaseAuth.authStateChanges().listen((User? user) {
      _user.value = user;
    });
    navigateToIntroScreen();
  }

  Future<void> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn();
    try {
      GoogleSignInAccount? account = await googleSignIn.signIn();
      if (account != null) {
        final authAccount = await account.authentication;
        final credential = GoogleAuthProvider.credential(
          idToken: authAccount.idToken,
          accessToken: authAccount.accessToken,
        );

        await _firebaseAuth.signInWithCredential(credential);
        await saveUser(account);
      }
    } on Exception catch (error) {
      AppLogger.e(error);
    }
  }

  void navigateToIntroScreen() {
    Get.offNamed(RouteNames.introScreen);
  }

  saveUser(GoogleSignInAccount account) {
    userRF.doc(account.email).set({
      "email": account.email,
      "name": account.displayName,
      "profilepic": account.photoUrl,
    });
  }
}
