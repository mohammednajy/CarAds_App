import 'package:car_ads_app/core/config/utils/extensions/app_sizes.dart';
import 'package:car_ads_app/core/router/router_extention.dart';
import 'package:car_ads_app/core/router/routes_name.dart';
import 'package:car_ads_app/features/auth/data/dats_source/auth_data_source.dart';
import 'package:car_ads_app/features/auth/data/models/user_model.dart';
import 'package:car_ads_app/features/auth/domain/repository/auth_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


final authDataSourceProvider = Provider<AuthDataSource>((ref) {
  return AuthDataSource();
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final authDataSource = ref.watch(authDataSourceProvider);
  return AuthRepository(authDataSource: authDataSource);
});

class LoginProvider extends AutoDisposeAsyncNotifier<UserModel?> {
  @override
  UserModel? build() => null;

  //------------------------------ login ------------------------------
  void login({required String email, required String password}) async {
    state = const AsyncLoading();
    final authRepository = ref.read(authRepositoryProvider);
    state = await AsyncValue.guard(
      () async => authRepository.login(email: email, password: password),
    );
    navigatorKey.currentContext!.navigateAndRemoveUntil(
        RoutesName.homeScreenTest, (_) => false);
  }

  //------------------------------ ReSet Password ------------------------------

  Future<void> reSetPassword({required String email}) async {
    try {
      state = const AsyncLoading();
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      navigatorKey.currentContext!.navigateTo(RoutesName.checkEmailScreen);
    } on FirebaseException catch (e){
      print(e.message.toString());
    }
  }
//------------------------------ signInWithGoogle------------------------------
  Future<void> signInWithGoogle() async {
    try {
      state = const AsyncLoading();
      final authRepository = ref.read(authRepositoryProvider);
      state = await AsyncValue.guard(
            () async => authRepository.signUpWithGoogle(),
      );
      navigatorKey.currentContext!.navigateAndRemoveUntil(RoutesName.homeScreenTest,(_)=> false);
    } on FirebaseException catch (e) {
      throw e.toString();
    }
  }
}

final loginProvider =
    AsyncNotifierProvider.autoDispose<LoginProvider, UserModel?>(
        () => LoginProvider());

final showPassProvider = StateProvider.autoDispose<bool>((ref) => true);
