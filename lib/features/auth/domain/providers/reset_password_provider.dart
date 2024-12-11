import 'package:car_ads_app/core/config/utils/extensions/app_sizes.dart';
import 'package:car_ads_app/core/router/router_extention.dart';
import 'package:car_ads_app/core/router/routes_name.dart';
import 'package:car_ads_app/core/services/remote/remote_data_source.dart';
import 'package:car_ads_app/features/auth/data/dats_source/auth_data_source.dart';
import 'package:car_ads_app/features/auth/data/models/user_model.dart';
import 'package:car_ads_app/features/auth/domain/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authDataSourceProvider = Provider<AuthDataSource>((ref) {
  return AuthDataSource(remoteDataSource: ref.read(remoteDataSourceProvider));
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final authDataSource = ref.watch(authDataSourceProvider);
  return AuthRepository(authDataSource: authDataSource);
});

class ResetPasswordProvider extends AutoDisposeAsyncNotifier<UserModel?> {
  @override
  UserModel? build() => null;
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
}

final reSetPasswordProvider =
AsyncNotifierProvider.autoDispose<ResetPasswordProvider, UserModel?>(
        () => ResetPasswordProvider());

final isShowProvider = StateProvider.autoDispose<bool>((ref) => true);