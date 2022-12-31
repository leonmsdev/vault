import 'dart:developer' as devtool show log;
import 'package:firebase_auth/firebase_auth.dart';

class UserAuth {
  FirebaseAuth auth = FirebaseAuth.instance;

  checkUser() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        devtool.log('User is currently signed out!');
      } else {
        devtool.log('User is signed in!');
      }
    });
  }

  registerUser(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        devtool.log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        devtool.log('The account already exists for that email.');

        return e.code.toString();
      }
    } catch (e) {
      devtool.log(e.toString());
    }
  }

  signIn(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        devtool.log('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        devtool.log('Wrong password provided for that user.');
      }
    }
  }
}
