import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:provider/provider.dart';

import '../providers/authorization_provider.dart';
import '../utils/constanst.dart';

class RegistrationScreen extends StatefulWidget {
  final Function()? onClickedSingUp;
  const RegistrationScreen({Key? key, this.onClickedSingUp}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final formKey = GlobalKey<FormState>();

  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Widget loginAcc() {
    return Padding(
      padding: const EdgeInsets.only(top: 96, left: 23),
      child: Row(
        children: <Widget>[
          const Text(
            'Registr Accoutn',
            style: TextStyle(
              fontFamily: 'San-Francisco',
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Image.asset(
            'assets/images/User.png',
            width: 22,
            height: 22,
          ),
        ],
      ),
    );
  }

  Widget loginField() {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 70, bottom: 40),
      child: TextFormField(
        controller: loginController,
        style: textFieldInputTextStyle,
        decoration: loginFieldDecoration,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (email) => email != null && !EmailValidator.validate(email)
            ? 'Enter validate email'
            : null,
      ),
    );
  }

  Widget passField() {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: TextFormField(
        controller: passwordController,
        obscureText: true,
        style: textFieldInputTextStyle,
        decoration: passFieldDecoration,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) => value != null && value.length < 6
            ? 'Enter minimum 6 characters'
            : null,
      ),
    );
  }

  Widget singUpButtons() {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: MaterialButton(
          elevation: 0,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minWidth: double.infinity,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          height: 48,
          onPressed: () {
            context.read<AuthorizationProvider>().signUpWithEmail(
                context, formKey, loginController, passwordController);
          },
          color: const Color(0xFFFFC600),
          child: const Text(
            'Sign up',
            style: buttonTextStyle,
          ),
        ),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backgroundImage,
      constraints: const BoxConstraints.expand(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                loginAcc(),
                Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Image.asset(
                    'assets/images/BoorShop.png',
                    fit: BoxFit.cover,
                  ),
                ),
                loginField(),
                passField(),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'Already have an account?',
                      style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'San-Francisco',
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF636363),
                          letterSpacing: 1.2),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(right: 25, left: 3),
                        child: GestureDetector(
                          onTap: widget.onClickedSingUp,
                          child: const Text('Log In',
                              style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: 'San-Francisco',
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF0C1F22),
                                  letterSpacing: 1.2)),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                singUpButtons(),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
