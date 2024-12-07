import 'package:car_ads_app/features/home/data/models/car_model.dart';
import 'package:car_ads_app/features/home/domain/repository/home_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final bannersProvider = FutureProvider.autoDispose<List<CarModel>>((ref) async {
  return ref.read(homeRepositoryProvider).getBanners();
});
