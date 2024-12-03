// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:car_ads_app/features/home/data/data_source/home_data_source.dart';
import 'package:car_ads_app/features/home/data/models/car_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeRepository {
  final HomeDataSource homeDataSource;
  HomeRepository({
    required this.homeDataSource,
  });

  Future<List<CarModel>> getBanners() async {
    try {
      final response = await homeDataSource.getBanners();

      return response.map((car) => CarModel.fromJson(car)).toList();
    } on FirebaseException catch (e) {
      throw e.message ?? 'something went wrong';
    } catch (e) {
      throw e.toString();
    }
  }
}

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return HomeRepository(homeDataSource: ref.read(homeDataSourceProvider));
});
