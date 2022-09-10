import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:handysub/Models/UserModel.dart';
import 'package:handysub/Providers/UserProvider.dart';

class SignUpViewModel with ChangeNotifier {
  signUp(User user) {
    FirebaseFirestore.instance
        .collection("User")
        .doc(user.email)
        .set(UserProvider().signUpUserData());
  }
}
