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
      if (response != null) {
        return UserModel(
          email: response["email"]!,
          password: response["password"]!,
        );
        // here we can save the user data if you need "locally".
      }
      throw 'Something went wrong';
    } on Exception catch (e) {
      throw e.toString();
    }
  }
}


