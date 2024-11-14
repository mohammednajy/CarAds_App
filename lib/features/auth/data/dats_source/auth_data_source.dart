import 'package:car_ads_app/features/auth/data/dats_source/firebase_source.dart';
import 'package:car_ads_app/features/auth/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthDataSource {
  Future<DocumentSnapshot<Map<String, dynamic>>> login(
      {required String email, required String password}) async {
    try {
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
      return await AuthFirebase.signUpWithEmailAndPassword(
          email: email, password: password, phone: phone, fullName: fullName);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<UserModel> signUpWithGoogle() async {
    try {
      return await AuthFirebase.signUpWithGoogle();
    } catch (e) {
      throw e.toString();
    }
  }
}
