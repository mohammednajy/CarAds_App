import 'dart:async';
import 'package:car_ads_app/core/config/utils/extensions/app_sizes.dart';
import 'package:car_ads_app/core/router/router_extention.dart';
import 'package:car_ads_app/core/router/routes_name.dart';
import 'package:car_ads_app/core/services/remote/remote_data_source.dart';
import 'package:car_ads_app/features/auth/data/dats_source/auth_data_source.dart';
import 'package:car_ads_app/features/auth/data/models/user_model.dart';
import 'package:car_ads_app/features/auth/domain/repository/auth_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authDataSourceProvider = Provider<AuthDataSource>((ref) =>
    AuthDataSource(remoteDataSource: ref.read(remoteDataSourceProvider)));

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final authDataSource = ref.watch(authDataSourceProvider);
  return AuthRepository(authDataSource: authDataSource);
});

class SignInWithGoogleProvider extends AutoDisposeAsyncNotifier<UserModel?> {
  @override
  UserModel? build() => null;

  //------------------------------ signInWithGoogle------------------------------

  Future<void> signInWithGoogle() async {
      state = const AsyncLoading();
      final authRepository = ref.read(authRepositoryProvider);
      state = await AsyncValue.guard(
        () async => authRepository.signUpWithGoogle().then((_){
          navigatorKey.currentContext!
              .navigateAndRemoveUntil(RoutesName.mainAppScreen, (_) => false);
        }),
      );
  }
}

final signInWithGoogleProvider =
    AsyncNotifierProvider.autoDispose<SignInWithGoogleProvider, UserModel?>(
        () => SignInWithGoogleProvider());
