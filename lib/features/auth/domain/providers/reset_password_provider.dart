import 'package:car_ads_app/core/services/remote/remote_data_source.dart';
import 'package:car_ads_app/features/auth/data/dats_source/auth_data_source.dart';
import 'package:car_ads_app/features/auth/domain/repository/auth_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authDataSourceProvider = Provider<AuthDataSource>((ref) {
  return AuthDataSource(remoteDataSource: ref.read(remoteDataSourceProvider));
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final authDataSource = ref.watch(authDataSourceProvider);
  return AuthRepository(authDataSource: authDataSource);
});

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
