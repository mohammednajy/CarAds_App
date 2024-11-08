import 'package:car_ads_app/core/config/utils/extensions/app_sizes.dart';
import 'package:car_ads_app/core/router/router_extention.dart';
import 'package:car_ads_app/core/router/routes_name.dart';
import 'package:car_ads_app/core/services/firebase_constant.dart';
import 'package:car_ads_app/core/services/localStorage/shared_pref_setup.dart';
import 'package:car_ads_app/features/auth/data/models/user_model.dart';
import 'package:car_ads_app/features/auth/domain/providers/auth_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final loginProvider = StateNotifierProvider<LoginProvider, bool>(
    (ref) => LoginProvider(ref.watch(authServicesProvider)));

class LoginProvider extends StateNotifier<bool> {
  // notifier
  UserModel? user;

  FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final AuthServices authServices;

  LoginProvider(this.authServices) : super(false);

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      state = true;

      final credential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Fetch user data from FireStore and update it
      final userDoc = await firebaseFireStore
          .collection(FirebaseConstant.usersCollection)
          .doc(credential.user!.uid)
          .get();

      final userModel = UserModel.fromDocumentSnapshot(userDoc);

      SharedPrefController.setLoggedIn();
      SharedPrefController.saveUserData(userModel);

      navigatorKey.currentContext!.navigateTo(RoutesName.oTPScreen); //  form ui
    } on FirebaseException catch (e) {
      print(e.toString());
    } finally {
      state = false;
    }
  }
}
