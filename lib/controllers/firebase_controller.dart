import 'dart:io';

import 'package:blog_app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> saveUserToFirestore(
      String userName, String email, String profileImage) async {
    try {
      String? photoUrl = await uploadPhotoAndSaveUrl(File(profileImage));
      UserModel user = UserModel(
        id: _auth.currentUser!.uid,
        userName: userName,
        email: email,
        profileImage: photoUrl!,
      );
      await _firestore.collection('users').doc(user.email).set(user.toJson());
    } catch (e) {
      print('Error saving user: $e');
    }
  }

  Future<String?> uploadPhotoAndSaveUrl(File photo) async {
    try {
      String email = _auth.currentUser!.email!;
      // Create a reference to the location you want to upload to in Firebase Storage
      Reference storageRef = _storage.ref().child('profile_photos/$email.jpg');

      // Upload the file to Firebase Storage
      UploadTask uploadTask = storageRef.putFile(photo);

      // Wait for the upload to complete
      TaskSnapshot snapshot = await uploadTask;

      // Get the download URL
      String downloadUrl = await snapshot.ref.getDownloadURL();

      return downloadUrl;
    } catch (e) {
      print('Error uploading photo: $e');
      return null;
    }
  }
}
