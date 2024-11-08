import 'package:car_ads_app/core/services/firebase_constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthDataSource {
  Future<DocumentSnapshot<Map<String, dynamic>>> login(
      {required String email, required String password}) async {
    try {
      await Future.delayed(const Duration(seconds: 3));
      return await AuthFirebase.loginWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> signUp({
    required String email,
    required String password,
    required String phone,
    required String fullName,
  }) async {
    try {
      await Future.delayed(const Duration(seconds: 20));
      return await AuthFirebase.signUpWithEmailAndPassword(
          email: email, password: password, phone: phone, fullName: fullName);
    } catch (e) {
      throw e.toString();
    }
  }
}

// assume this is a firebase auth service
class AuthFirebase {
  static Future<DocumentSnapshot<Map<String, dynamic>>>
      loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final userDoc = await FirebaseFirestore.instance
        .collection(FirebaseConstant.usersCollection)
        .doc(credential.user!.uid)
        .get();
    return userDoc;
  }

  static Future<DocumentSnapshot<Map<String, dynamic>>>
      signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String phone,
    required String fullName,
  }) async {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final uid = credential.user!.uid;
    await FirebaseFirestore.instance
        .collection(FirebaseConstant.usersCollection)
        .doc(uid)
        .set({
      FirebaseConstant.uId: uid,
      FirebaseConstant.email: email,
      FirebaseConstant.fullName: fullName,
      FirebaseConstant.phone: phone,
      FirebaseConstant.image: '',
    });
    await credential.user!.updateDisplayName(fullName);

    final userDoc = await FirebaseFirestore.instance
        .collection(FirebaseConstant.usersCollection)
        .doc(credential.user!.uid)
        .get();
    return userDoc;
  }
}
