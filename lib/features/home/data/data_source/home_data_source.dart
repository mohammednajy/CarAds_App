// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:car_ads_app/core/services/remote/remote_data_source.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeDataSource {
  RemoteDataSource remoteDataSource;
  HomeDataSource({
    required this.remoteDataSource,
  });

  Future<List<Map<String, dynamic>>> getBanners() async {
    try {
      final response = await remoteDataSource.bannersCollection.get();
      return response.docs.map((e) => e.data()).toList();
    } catch (e) {
      rethrow;
    }
  }
}

final homeDataSourceProvider = Provider<HomeDataSource>((ref) {
  return HomeDataSource(remoteDataSource: ref.read(remoteDataSourceProvider));
});
