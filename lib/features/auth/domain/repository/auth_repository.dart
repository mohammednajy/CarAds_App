import 'package:car_ads_app/core/services/localStorage/shared_pref_setup.dart';
import 'package:car_ads_app/features/auth/data/dats_source/auth_data_source.dart';
import 'package:car_ads_app/features/auth/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  AuthDataSource authDataSource;

  AuthRepository({required this.authDataSource});

  //------------------------ loginWithEmailAndPassword ---------------------------

  Future<UserModel?> singIn(
      {required String email, required String password}) async {
    try {
      final response = await authDataSource.signInWithEmailAndPassword(
          email: email, password: password);
      final userModel = UserModel.fromDocumentSnapshot(response);
      SharedPrefController.setLoggedIn();
      SharedPrefController.saveUserData(userModel);
      return userModel;
    } on FirebaseAuthException catch (e) {
      throw e.message ?? '';
    }
  }

  //------------------------ signUpWithEmailAndPassword ---------------------------

  Future<UserModel?> signUp(
      {required String email,
      required String password,
      required String fullName,
      required String phone}) async {
    try {
      final userData = await authDataSource.signUpWithEmailAndPassword(
        email: email,
        password: password,
        phone: phone,
        fullName: fullName,
      );
      SharedPrefController.setLoggedIn();
      SharedPrefController.saveUserData(userData);
      return userData;
    } on FirebaseAuthException catch (e) {
      throw e.message ?? '';
    }
  }

  //------------------------ signUpWithGoogle ---------------------------

  Future<UserModel?> signUpWithGoogle() async {
    try {
      final user = await authDataSource.signUpWithGoogle();
      SharedPrefController.setLoggedIn();
      SharedPrefController.saveUserData(user);
      return user;
    } on FirebaseAuthException catch (e) {
      throw e.message ?? '';
    }
  }

  //------------------------ signInWithFacebook ---------------------------

  Future<UserModel?> signInWithFacebook() async {
    try {
      final user = await authDataSource.signInWithFacebook();
      SharedPrefController.saveUserData(user);
      SharedPrefController.setLoggedIn();
      return user;
    } on FirebaseAuthException catch (e) {
      throw e.message ?? '';
    }
  }

  //------------------------ signInWithFacebook ---------------------------

  Future<String?> forgetPassword({
    required String email,
  }) async {
    try {
      return await authDataSource.forgetPassword(email: email);
    } on FirebaseAuthException catch (e) {
      throw e.message ?? '';
    }
  }

  //------------------------ singOut ---------------------------

  Future<void> singOut() async {
    try {
      await authDataSource.signOut();
      SharedPrefController.removeUser();
    } on FirebaseAuthException catch (e) {
      throw e.message ?? '';
    }
  }
}
