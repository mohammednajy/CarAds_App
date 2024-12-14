import 'package:car_ads_app/core/services/localStorage/shared_pref_setup.dart';
import 'package:car_ads_app/features/auth/data/dats_source/auth_data_source.dart';
import 'package:car_ads_app/features/auth/data/models/user_model.dart';

class AuthRepository {
  AuthDataSource authDataSource;

  AuthRepository({required this.authDataSource});

  //------------------------ loginWithEmailAndPassword ---------------------------

  Future<UserModel?> singIn(
      {required String email, required String password}) async {
    try {
      final response = await authDataSource.loginWithEmailAndPassword(
          email: email, password: password);
      final userModel = UserModel.fromDocumentSnapshot(response);
      SharedPrefController.setLoggedIn();
      SharedPrefController.saveUserData(userModel);
      return userModel;
    } catch (e) {
      throw e.toString();
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
    } catch (e) {
      throw e.toString();
    }
  }

  //------------------------ signUpWithGoogle ---------------------------

  Future<UserModel?> signUpWithGoogle() async {
    try {
      final user = await authDataSource.signUpWithGoogle();
      SharedPrefController.setLoggedIn();
      SharedPrefController.saveUserData(user);
      return user;
    } catch (e) {
      throw e.toString();
    }
  }

  //------------------------ signInWithFacebook ---------------------------

  Future<UserModel?> signInWithFacebook() async {
    try {
      final user = await authDataSource.signInWithFacebook();
      SharedPrefController.saveUserData(user);
      SharedPrefController.setLoggedIn();
      return user;
    } catch (e) {
      throw e.toString();
    }
  }

  //------------------------ loginWithEmailAndPassword ---------------------------

  Future<void> singOut() async {
    try {
      await authDataSource.signOut();
      SharedPrefController.removeUser();
    } catch (e) {
      throw e.toString();
    }
  }
}
