import 'package:car_ads_app/features/auth/data/dats_source/auth_data_source.dart';
import 'package:car_ads_app/features/auth/data/models/user_model.dart';
import 'package:car_ads_app/features/auth/domain/repository/auth_repository.dart';
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

  void login({required String email, required String password}) async {
    state = const AsyncLoading();
    final authRepository = ref.read(authRepositoryProvider);
    state = await AsyncValue.guard(
      () async => authRepository.login(email: email, password: password),
    );
  }
}

final loginProvider =
    AsyncNotifierProvider.autoDispose<LoginProvider, UserModel?>(
        () => LoginProvider());

final showPassProvider = StateProvider.autoDispose<bool>((ref) => true);
