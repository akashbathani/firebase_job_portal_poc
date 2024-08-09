import 'package:get/get.dart';
import 'package:firebase_job_portal_poc/services/firebase_service.dart';
import 'package:firebase_job_portal_poc/services/shared_preferences_service.dart';
import '../routes/app_routes.dart';

class LoginController extends GetxController {
  final FirebaseService _firebaseService = Get.find<FirebaseService>();
  var isLoading = false.obs;

  void signInWithGoogle() async {
    isLoading.value = true;
    try {
      final user = await _firebaseService.signInWithGoogle();
      if (user != null) {
        await _firebaseService.storeUserInFirestore(user);
        Get.offAllNamed(AppRoutes.companyList);
        await SharedPreferencesService.setBool("isLoggedIn", true);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void signOut() async {
    await _firebaseService.signOut();
    await SharedPreferencesService.setBool('isLoggedIn', false);
    Get.offAllNamed(AppRoutes.login);
  }
}
