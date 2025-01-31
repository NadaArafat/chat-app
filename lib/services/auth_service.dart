import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

Future<String> signup(String email, String password) async {
  try{
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return 'Account is created successfully!';
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      return 'The password provided is too weak.';
    } else if (e.code == 'email-already-in-use') {
      return 'The account already exists for that email.';
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  return 'There was an error,please try again';
}

Future<String> login(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
        email: email, password: password);
    return 'Logged in successfully,Welcome Back!';
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      return 'No user found for that email.';
    } else if (e.code == 'wrong-password') {
          return 'Wrong password provided for that user.';
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  return 'There was an error,please try again';
}
