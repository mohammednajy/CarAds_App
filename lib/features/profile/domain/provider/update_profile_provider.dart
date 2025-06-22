import 'dart:io';
import 'package:car_ads_app/core/config/utils/extensions/app_sizes.dart';
import 'package:car_ads_app/core/router/router_extention.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

final updateProfileProvider = FutureProvider.autoDispose((ref) async {
  // --------------------------- Edit Image ------------------------------------

  String? imageURL;
  File? photo;
  final ImagePicker picker = ImagePicker();

  Future uploadFile() async {
    if (photo == null) return;
    final fileName = basename(photo!.path);
    final destination = 'UsersImages/$fileName';
    try {
      final ref = FirebaseStorage.instance.ref(destination).child('file/');
      await ref.putFile(photo!);
      String downloadUrl = await ref.getDownloadURL();
      imageURL = downloadUrl;
    } on FirebaseException catch (e) {
      print('No image selected.');
    }
  }

  Future imgFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      photo = File(pickedFile.path);
      uploadFile();
      navigatorKey.currentContext!.goBack();
    } else {
      print('No image selected.');
    }
  }

  Future imgFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      photo = File(pickedFile.path);
      uploadFile();
      navigatorKey.currentContext!.goBack();
    } else {
      print('No image selected.');
    }
  }

  // TODO This function for test rePlace the path library

  String extractPathFromUrl(String url) {
    Uri uri = Uri.parse(url);

    //extracting the path from url we need
    String encodePath = uri.pathSegments.last;

    // url decoding the path
    return Uri.decodeComponent(encodePath);
  }
});
