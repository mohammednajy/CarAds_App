import 'package:car_ads_app/core/commonWidgets/popup_widget.dart';
import 'package:car_ads_app/core/config/utils/extensions/app_sizes.dart';
import 'package:car_ads_app/core/router/router_extention.dart';
import 'package:car_ads_app/core/router/routes_name.dart';
import 'package:car_ads_app/core/services/remote/remote_data_source.dart';
import 'package:car_ads_app/features/auth/data/dats_source/auth_data_source.dart';
import 'package:car_ads_app/features/auth/data/models/user_model.dart';
import 'package:car_ads_app/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authDataSourceProvider = Provider<AuthDataSource>((ref) {
  return AuthDataSource(remoteDataSource: ref.read(remoteDataSourceProvider));
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final authDataSource = ref.watch(authDataSourceProvider);
  return AuthRepository(authDataSource: authDataSource);
});

class LoginProvider extends AutoDisposeAsyncNotifier<UserModel?> {
  @override
  UserModel? build() => null;

  //------------------------------ signIn ------------------------------
  void signIn({required String email, required String password}) async {
    state = const AsyncLoading();
    final authRepository = ref.read(authRepositoryProvider);
    state = await AsyncValue.guard(
      () async => authRepository.singIn(email: email, password: password).then(
        (_) {
          navigatorKey.currentContext!
              .navigateAndRemoveUntil(RoutesName.mainAppScreen, (_) => false);
          navigatorKey.currentContext!.showSnackBar(
              message: 'Login Success', backgroundColor: Colors.teal);
          return null;
        },
      ),
    );
  }
}

final loginProvider =
    AsyncNotifierProvider.autoDispose<LoginProvider, UserModel?>(
        () => LoginProvider());

final showPassProvider = StateProvider.autoDispose<bool>((ref) => true);
