import 'package:flutter/material.dart';

import 'login_screen.dart';
import 'registration_screeen.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) => isLogin
      ? LoginScreen(
          onClickedSingIn: toggle,
        )
      : RegistrationScreen(
          onClickedSingUp: toggle,
        );
  void toggle() => setState(() {
        isLogin = !isLogin;
      });
}
