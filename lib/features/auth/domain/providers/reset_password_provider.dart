import 'package:car_ads_app/features/auth/domain/providers/signIn_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ResetPasswordProvider extends AutoDisposeAsyncNotifier<String?> {
  @override
  String? build() => null;

  //------------------------------ ReSet Password ------------------------------

  Future<void> reSetPassword({required String email}) async {
    state = const AsyncLoading();
    final authRepository = ref.read(authRepositoryProvider);
    state = await AsyncValue.guard(
        () async => authRepository.forgetPassword(email: email));
  }
}

final reSetPasswordProvider =
    AsyncNotifierProvider.autoDispose<ResetPasswordProvider, String?>(
        () => ResetPasswordProvider());

final isShowProvider = StateProvider.autoDispose<bool>((ref) => true);
