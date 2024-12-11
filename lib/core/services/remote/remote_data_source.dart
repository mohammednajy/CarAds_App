import 'package:car_ads_app/core/services/firebase_constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RemoteDataSource {
  final firestore = FirebaseFirestore.instance;
  CollectionReference<Map<String, dynamic>> get bannersCollection =>
      firestore.collection(FirebaseConstant.banars);

  final auth = FirebaseAuth.instance;
  CollectionReference<Map<String, dynamic>> get userCollection =>
      firestore.collection(FirebaseConstant.usersCollection);
}

final remoteDataSourceProvider = Provider<RemoteDataSource>((ref) {
  return RemoteDataSource();
});
