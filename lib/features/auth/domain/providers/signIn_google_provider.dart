import 'dart:async';
import 'package:car_ads_app/features/auth/data/models/user_model.dart';
import 'package:car_ads_app/features/auth/domain/providers/signIn_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInWithGoogleProvider extends AutoDisposeAsyncNotifier<UserModel?> {
  @override
  UserModel? build() => null;

  //------------------------------ signInWithGoogle------------------------------

  Future<void> signInWithGoogle() async {
    state = const AsyncLoading();
    final authRepository = ref.read(authRepositoryProvider);
    state =
        await AsyncValue.guard(() async => authRepository.signUpWithGoogle());
  }
}

final signInWithGoogleProvider =
    AsyncNotifierProvider.autoDispose<SignInWithGoogleProvider, UserModel?>(
        () => SignInWithGoogleProvider());
