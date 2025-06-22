import 'dart:async';
import 'package:car_ads_app/features/auth/data/models/user_model.dart';
import 'package:car_ads_app/features/auth/domain/providers/signIn_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInWithFacebookProvider extends AutoDisposeAsyncNotifier<UserModel?> {
  @override
  UserModel? build() => null;

  //------------------------------ signInWithFacebook------------------------------

  Future<void> signInWithFacebook() async {
    state = const AsyncLoading();
    final authRepository = ref.read(authRepositoryProvider);
    state =
        await AsyncValue.guard(() async => authRepository.signInWithFacebook());
  }
}

final signInWithFacebookProvider =
    AsyncNotifierProvider.autoDispose<SignInWithFacebookProvider, UserModel?>(
        () => SignInWithFacebookProvider());
