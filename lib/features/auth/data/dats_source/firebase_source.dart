// assume this is a firebase auth service
import 'package:car_ads_app/core/services/firebase_constant.dart';
import 'package:car_ads_app/features/auth/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthFirebase {

//------------------------ loginWithEmailAndPassword ---------------------------

  static Future<DocumentSnapshot<Map<String, dynamic>>>
  loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final userDoc = await FirebaseFirestore.instance
        .collection(FirebaseConstant.usersCollection)
        .doc(credential.user!.uid)
        .get();
    return userDoc;
  }
//------------------------ signUpWithEmailAndPassword --------------------------

  static Future<DocumentSnapshot<Map<String, dynamic>>>
  signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String phone,
    required String fullName,
  }) async {
    //  add try and catch
    final credential =
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    // create a new function
    final uid = credential.user!.uid;
    await FirebaseFirestore.instance
        .collection(FirebaseConstant.usersCollection)
        .doc(uid)
        .set({
      FirebaseConstant.uId: uid,
      FirebaseConstant.email: email,
      FirebaseConstant.fullName: fullName,
      FirebaseConstant.phone: phone,
      FirebaseConstant.image: '',
    });

    final userDoc = await FirebaseFirestore.instance
        .collection(FirebaseConstant.usersCollection)
        .doc(credential.user!.uid)
        .get();
    return userDoc;
  }
//------------------------ signUpWithGoogle--------------------------
  static Future<UserModel> signUpWithGoogle() async {
 try{
   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
   final GoogleSignInAuthentication? googleAuth =
   await googleUser?.authentication;
   final credential = GoogleAuthProvider.credential(
     accessToken: googleAuth?.accessToken,
     idToken: googleAuth?.idToken,
   );
   final credentialSign =
   await FirebaseAuth.instance.signInWithCredential(credential);
   if (await checkIfDocExists(credentialSign.user!.uid) == false) {
     final UserModel user = UserModel(
       uId: credentialSign.user!.uid,
       name: credentialSign.user!.displayName!,
       email: credentialSign.user!.email!,
       image: credentialSign.user!.photoURL ?? '',
       phone: credentialSign.user!.phoneNumber ?? '',
     );
     await FirebaseFirestore.instance
         .collection(FirebaseConstant.usersCollection)
         .doc(credentialSign.user!.uid)
         .set(user.toJson());
     return user;

   }else{
     final userDoc = await FirebaseFirestore.instance
         .collection(FirebaseConstant.usersCollection)
         .doc(credentialSign.user!.uid)
         .get();

     final userModel = UserModel.fromDocumentSnapshot(userDoc);
     return userModel;
   }
 } catch (e){
   throw e.toString();
 }
  }
  //----------------------------- Check If Document Exists ---------------------

 static Future<bool> checkIfDocExists(String docId) async {
    try {
      // Get reference to Firestore collection
      var collectionRef = FirebaseFirestore.instance
          .collection(FirebaseConstant.usersCollection);
      var doc = await collectionRef.doc(docId).get();
      return doc.exists;
    } catch (e) {
      throw e.toString();
    }
  }
}