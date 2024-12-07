import 'package:car_ads_app/core/services/localStorage/shared_pref_setup.dart';
import 'package:car_ads_app/features/auth/data/dats_source/auth_data_source.dart';
import 'package:car_ads_app/features/auth/data/models/user_model.dart';

class AuthRepository {
  AuthDataSource authDataSource;

  AuthRepository({
    required this.authDataSource,
  });

  Future<UserModel?> login(
      {required String email, required String password}) async {
    try {
      final response =
          await authDataSource.login(email: email, password: password);
      final userModel = UserModel.fromDocumentSnapshot(response);
      SharedPrefController.setLoggedIn();
      SharedPrefController.saveUserData(userModel);
      return userModel;
    } on Exception catch (e) {
      throw e.toString();
    }
  }

  Future<UserModel?> signUp(
      {required String email,
      required String password,
      required String fullName,
      required String phone}) async {
    try {
      final response = await authDataSource.signUp(
        email: email,
        password: password,
        phone: phone,
        fullName: fullName,
      );
      final userModel = UserModel.fromDocumentSnapshot(response);
      SharedPrefController.setLoggedIn();
      SharedPrefController.saveUserData(userModel);
      return userModel;
    } on Exception catch (e) {
      throw e.toString();
    }
  }


  Future<UserModel?> signUpWithGoogle() async {
    try {
      final user = await authDataSource.signUpWithGoogle();
      SharedPrefController.setLoggedIn();
      SharedPrefController.saveUserData(user);
      return user;
    } on Exception catch (e) {
      throw e.toString();
    }
  }


}
