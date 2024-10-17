class AuthDataSource {
  Future<Map<dynamic, String>?> login(
      {required String email, required String password}) async {
    try {
      await Future.delayed(const Duration(seconds: 3));
      return await AuthFirebase.loginWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      throw e.toString();
    }
  }
}

// assume this is a firebase auth service
class AuthFirebase {
  static Future<Map<dynamic, String>> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    if (email == "moh@gmail.com" && password == "1234") {
      return {"email": "moh@gmail.com", "password": "1234"};
    }
    throw 'wrong email or password';
  }
}
