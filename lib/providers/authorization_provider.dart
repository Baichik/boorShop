import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../main.dart';
import '../utils/utils.dart';

class AuthorizationProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future<void> signInWithEmail(
      BuildContext context,
      TextEditingController loginController,
      TextEditingController passwordController) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: loginController.text.trim(),
        password: passwordController.text.trim(),
      );
      loginController.clear();
      passwordController.clear();
    } on FirebaseAuthException catch (e) {
      print(e);
      Utils.showSnackBar(e.message);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
    notifyListeners();
  }

  Future<void> signUpWithEmail(
      BuildContext context,
      GlobalKey<FormState> formKey,
      TextEditingController loginController,
      TextEditingController passwordController) async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: loginController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
      Utils.showSnackBar(e.message);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
    notifyListeners();
  }

  void signOutWithEmail() {
    FirebaseAuth.instance.signOut();
  }

  Future<void> loginWithGoogle() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;
      _user = googleUser;
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print(e);
    }

    notifyListeners();
  }

  Future<void> logOutWithGoogle() async {
    await googleSignIn.signOut();
    FirebaseAuth.instance.signOut();
  }

  Future<void> signInWithFacebook() async {
    try {
      final facebookLoginResult = await FacebookAuth.instance.login();
      final userData = await FacebookAuth.instance.getUserData();

      final facebookAuthCredential = FacebookAuthProvider.credential(
          facebookLoginResult.accessToken!.token);
      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  Future<void> logOutFacebook() async {
    await FacebookAuth.instance.logOut();
    FirebaseAuth.instance.signOut();
  }
}
