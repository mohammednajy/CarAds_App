import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uId;
  final String name;
  final String email;
  final String image;
  final String phone;

  UserModel({
    required this.uId,
    required this.name,
    required this.email,
    required this.image,
    required this.phone,
  });

  factory UserModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return UserModel(
      uId: data['uid'],
      name: data['name'],
      email: data['email'],
      image: data['image'] ?? '',
      phone: data['phone'] ?? '',
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uId: json['uid'],
      name: json['name'],
      email: json['email'],
      image: json['image'] ?? '',
      phone: json['phone'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uId,
      'name': name,
      'email': email,
      'image': image,
      'phone': phone,
    };
  }

  UserModel copyWith({String? selectedGoal}) {
    return UserModel(
      uId: uId,
      name: name,
      email: email,
      image: image,
      phone: phone,
    );
  }

  UserModel copyWithUserProfile(
      {String? name, String? email, String? phone, String? image}) {
    return UserModel(
      uId: uId,
      name: name ?? this.name,
      email: email ?? this.email,
      image: image ?? this.image,
      phone: phone ?? this.phone,
    );
  }

  UserModel copyWithLevel({level}) {
    return UserModel(
      uId: uId,
      name: name,
      email: email,
      image: image,
      phone: phone,
    );
  }
}
