import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_job_portal_poc/services/shared_preferences_service.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../routes/app_routes.dart';

class LoginController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;
  var isLoading = false.obs;

  void signInWithGoogle() async {
    isLoading.value = true;
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        final User user = (await auth.signInWithCredential(credential)).user!;

        await _storeUserInFirestore(user);

        Get.offAllNamed(AppRoutes.companyList);
        await SharedPreferencesService.setBool("isLoggedIn", true);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
      print("=-=-=-=->${e.toString()}");
    } finally {
      isLoading.value = false;
    }
  }

  void signOut() async {
    await googleSignIn.signOut();
    await auth.signOut();
    await SharedPreferencesService.setBool('isLoggedIn', false);
    Get.offAllNamed(AppRoutes.login);
  }

  Future<void> _storeUserInFirestore(User user) async {
    try {
      DocumentReference userDocRef =
          firebaseFireStore.collection('users').doc(user.uid);

      DocumentSnapshot userDoc = await userDocRef.get();

      if (userDoc.exists) {
        await userDocRef.update({
          'lastSignInTime': DateTime.now(),
        });
      } else {
        await userDocRef.set({
          'uid': user.uid,
          'displayName': user.displayName,
          'email': user.email,
          'photoURL': user.photoURL,
          'lastSignInTime': DateTime.now(),
          'appliedCompanies': []
        });
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to store user information');
    }
  }
}
