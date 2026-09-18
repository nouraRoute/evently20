import 'dart:developer';

import 'package:evently/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  static Future<void> login(UserModel user) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      log('--->>SUCCESS');
    } catch (e) {
      log('--->>$e');
    }
  }

  static Future<void> register(UserModel user) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      log('--->>SUCCESS');
    } catch (e) {
      log('--->>$e');
    }
  }

  //login
  //get user info
  //register
  //logout
  //forgot password
  //google login
  //delete account
}
