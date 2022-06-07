import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/authorization_provider.dart';
import '../utils/constanst.dart';

class LoginScreen extends StatefulWidget {
  final Function()? onClickedSingIn;
  const LoginScreen({Key? key, this.onClickedSingIn}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backgroundImage,
      constraints: const BoxConstraints.expand(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 86, left: 23),
                child: Row(
                  children: <Widget>[
                    const Text(
                      'Login Account',
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
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Image.asset(
                  'assets/images/BoorShop.png',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 25, right: 25, top: 50, bottom: 25),
                child: TextField(
                  controller: loginController,
                  style: textFieldInputTextStyle,
                  decoration: loginFieldDecoration,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  style: textFieldInputTextStyle,
                  decoration: passFieldDecoration,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'Not register yet?',
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
                        onTap: widget.onClickedSingIn,
                        child: const Text('Create Account',
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
                height: 50,
              ),
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
                    context.read<AuthorizationProvider>().signInWithEmail(
                        context, loginController, passwordController);
                  },
                  color: const Color(0xFFFFC600),
                  child: const Text(
                    'Login',
                    style: buttonTextStyle,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: const Color(0xFFA39797),
                    width: 105,
                    height: 1,
                  ),
                  const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: Text('Or sign in with')),
                  Container(
                    color: const Color(0xFFA39797),
                    width: 105,
                    height: 1,
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.read<AuthorizationProvider>().loginWithGoogle();
                    },
                    child: Container(
                      width: 75,
                      height: 48,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF000000).withOpacity(0.25),
                              blurRadius: 1,
                              offset: const Offset(0, 1),
                            )
                          ]),
                      child: Image.asset('assets/images/google logo.png'),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context
                          .read<AuthorizationProvider>()
                          .signInWithFacebook();
                    },
                    child: Container(
                      width: 75,
                      height: 48,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF000000).withOpacity(0.25),
                              blurRadius: 1,
                              offset: const Offset(0, 1),
                            )
                          ]),
                      child: Image.asset('assets/images/facebook logo.png'),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
