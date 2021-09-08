import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  void createUserWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      final newUser = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (newUser != null) {
        Navigator.pushNamed(context, 'home_screen');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  void loginWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      final user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (user != null) {
        Navigator.pushNamed(context, 'home_screen');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  //using this function you can use the credentials of the user
  void getCurrentUser(User? loggedinUser) async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedinUser = user;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  void signOut() {
    _auth.signOut();
  }
}
