import 'package:hooks_riverpod/hooks_riverpod.dart';

final authServicesProvider = Provider<AuthServices>((ref) => AuthServices());

class AuthServices {
  bool isLogin = false;

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 3), () {
      isLogin = true;
    });

    return isLogin;
  }
}
