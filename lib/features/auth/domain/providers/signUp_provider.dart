import 'package:car_ads_app/features/auth/data/models/user_model.dart';
import 'package:car_ads_app/features/auth/domain/providers/signIn_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignUpProvider extends AutoDisposeAsyncNotifier<UserModel?> {
  @override
  UserModel? build() => null;

  void signUp({
    required String email,
    required String password,
    required String fullName,
    required String phone,
  }) async {
    state = const AsyncLoading();
    final authRepository = ref.read(authRepositoryProvider);
    state = await AsyncValue.guard(() async => authRepository.signUp(
          email: email,
          password: password,
          fullName: fullName,
          phone: phone,
        ));
  }
}

final signUpProvider =
    AsyncNotifierProvider.autoDispose<SignUpProvider, UserModel?>(
        () => SignUpProvider());

final isShowProvider = StateProvider.autoDispose<bool>((ref) => true);
