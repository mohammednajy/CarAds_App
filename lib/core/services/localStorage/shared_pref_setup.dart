import 'dart:convert';
import 'package:car_ads_app/features/auth/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PrefKeys {
  user,
  token,
  loggedIn,
  showOnce,
}

class SharedPrefController {
  static late final SharedPreferences preferences;

  static Future<SharedPreferences> init() async =>
      preferences = await SharedPreferences.getInstance();

  // -----------------------  Show OnBoarding  ---------------------------------

  Future<void> setShowOnce(bool showOnce) async {
    await preferences.setBool(PrefKeys.showOnce.toString(), showOnce);
  }

  bool getShowOnce() =>
      preferences.getBool(PrefKeys.showOnce.toString()) ?? false;

  // ---------------------------  User Logged in  ------------------------------

  Future<void> setLoggedIn() async {
    await preferences.setBool(PrefKeys.loggedIn.toString(), true);
  }

  bool getLoggedIn() =>
      preferences.getBool(PrefKeys.loggedIn.toString()) ?? false;

  // ---------------------------  User Data  -----------------------------------

  void removeUser() {
    if (preferences.containsKey(PrefKeys.user.toString())) {
      preferences.remove(PrefKeys.user.toString());
    }
    if (preferences.containsKey(PrefKeys.loggedIn.toString())) {
      preferences.remove(PrefKeys.loggedIn.toString());
    }
  }

  Future<void> clear() async {
    preferences.clear();
  }

  Future<void> saveUserData(UserModel user) async {
    preferences.setString(PrefKeys.user.toString(), jsonEncode(user.toJson()));
  }

  UserModel getUserData() {
    final userData = preferences.getString(PrefKeys.user.toString());

    if (userData != null) {
      return UserModel.fromJson(jsonDecode(userData));
    }
    return UserModel(
      uId: '',
      name: '',
      email: '',
      image: '',
      phone: '',
    );
  }
}
