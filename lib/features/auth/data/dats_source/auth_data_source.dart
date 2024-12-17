import 'package:car_ads_app/core/services/remote/remote_data_source.dart';
import 'package:car_ads_app/features/auth/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthDataSource {
  RemoteDataSource remoteDataSource;

  AuthDataSource({required this.remoteDataSource});

  //------------------------ loginWithEmailAndPassword -------------------------

  Future<DocumentSnapshot<Map<String, dynamic>>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await remoteDataSource.auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final userDoc =
          remoteDataSource.userCollection.doc(credential.user!.uid).get();
      return userDoc;
    } catch (e) {
      rethrow;
    }
  }

//------------------------ signUpWithEmailAndPassword --------------------------

  Future<UserModel> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String phone,
    required String fullName,
  }) async {
    try {
      final credential =
          await remoteDataSource.auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final uid = credential.user!.uid;
      final UserModel user = UserModel(
        uId: uid,
        name: fullName,
        email: email,
        image: '',
        phone: phone,
      );
      await remoteDataSource.userCollection.doc(uid).set(user.toJson());
      return user;
    } catch (e) {
      rethrow;
    }
  }

  //------------------------ signUpWithGoogle--------------------------

  Future<UserModel> signUpWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final credentialSign =
          await remoteDataSource.auth.signInWithCredential(credential);

      if (await checkIfDocExists(credentialSign.user!.uid) == false) {
        final UserModel user = UserModel(
          uId: credentialSign.user!.uid,
          name: credentialSign.user!.displayName!,
          email: credentialSign.user!.email!,
          image: credentialSign.user!.photoURL ?? '',
          phone: credentialSign.user!.phoneNumber ?? '',
        );
        await remoteDataSource.userCollection
            .doc(credentialSign.user!.uid)
            .set(user.toJson());
        return user;
      } else {
        final UserModel user = UserModel(
          uId: credentialSign.user!.uid,
          name: credentialSign.user!.displayName!,
          email: credentialSign.user!.email!,
          image: credentialSign.user!.photoURL ?? '',
          phone: credentialSign.user!.phoneNumber ?? '',
        );
        return user;
      }
    } catch (e) {
      rethrow;
    }
  }

  //----------------------------- Check If Document Exists ---------------------

  Future<bool> checkIfDocExists(String docId) async {
    try {
      var doc = await remoteDataSource.userCollection.doc(docId).get();
      return doc.exists;
    } catch (e) {
      rethrow;
    }
  }

  //------------------------ signInWithFacebook--------------------------

  Future<UserModel> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(result.accessToken!.token);
      final UserCredential userCredential = await remoteDataSource.auth
          .signInWithCredential(facebookAuthCredential);

      if (await checkIfDocExists(userCredential.user!.uid) == false) {
        final UserModel user = UserModel(
          uId: userCredential.user!.uid,
          name: userCredential.user!.displayName!,
          email: userCredential.user!.email!,
          image: userCredential.user!.photoURL ?? '',
          phone: userCredential.user!.phoneNumber ?? '',
        );
        await remoteDataSource.userCollection
            .doc(userCredential.user!.uid)
            .set(user.toJson());
        return user;
      } else {
        final UserModel user = UserModel(
          uId: userCredential.user!.uid,
          name: userCredential.user!.displayName!,
          email: userCredential.user!.email!,
          image: userCredential.user!.photoURL ?? '',
          phone: userCredential.user!.phoneNumber ?? '',
        );
        return user;
      }
    } catch (e) {
      rethrow;
    }
  }

  //------------------------ loginWithEmailAndPassword -------------------------

  Future<String> forgetPassword({required String email}) async {
    try {
      await remoteDataSource.auth.sendPasswordResetEmail(email: email);
      return '';
    } catch (e) {
      rethrow;
    }
  }

  //----------------------------- signOut ----------------------------------

  Future<void> signOut() async {
    try {
      await remoteDataSource.auth.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
