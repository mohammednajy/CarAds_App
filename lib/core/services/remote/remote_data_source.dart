import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RemoteDataSource {
  final firestore = FirebaseFirestore.instance;
  CollectionReference<Map<String, dynamic>> get bannersCollection =>
      firestore.collection('banars');
}

final remoteDataSourceProvider = Provider<RemoteDataSource>((ref) {
  return RemoteDataSource();
});
