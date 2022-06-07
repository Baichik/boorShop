import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/authorization_provider.dart';
import '../utils/constanst.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: backgroundImage,
        constraints: const BoxConstraints.expand(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: Image.network(user!.photoURL ??
                        'https://www.tenforums.com/geek/gars/images/2/types/thumb_15951118880user.png')
                    .image,
                radius: 50,
              ),
              const SizedBox(height: 20),
              Text(
                user!.displayName ?? '',
                style: accountTextStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                user!.email ?? "",
                style: accountTextStyle,
              ),
              const SizedBox(
                height: 200,
              ),
              MaterialButton(
                elevation: 0,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                minWidth: MediaQuery.of(context).devicePixelRatio,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                height: 38,
                onPressed: () =>
                    context.read<AuthorizationProvider>().signOutWithEmail(),
                color: const Color(0xFFFFC600),
                child: const Text(
                  'Log out',
                  style: buttonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
