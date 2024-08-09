import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseService extends GetxService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  FirebaseAuth get auth => _auth;
  FirebaseFirestore get firestore => _firestore;

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        final User user = (await _auth.signInWithCredential(credential)).user!;
        return user;
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  Future<void> storeUserInFirestore(User user) async {
    DocumentReference userDocRef =
    _firestore.collection('users').doc(user.uid);
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
  }

  Future<DocumentSnapshot> getUserDocument(String uid) {
    return _firestore.collection('users').doc(uid).get();
  }

  Future<void> updateUserAppliedCompanies(String uid, int companyId) async {
    await _firestore.collection('users').doc(uid).update({
      'appliedCompanies': FieldValue.arrayUnion([companyId])
    });
  }
}
