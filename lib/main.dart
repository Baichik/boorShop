import 'package:boor_shop/widgets/bottom_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/authorization_provider.dart';
import 'screens/account_screen.dart';
import 'screens/auth_screen.dart';
import 'utils/utils.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screeen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthorizationProvider>(
              create: (context) => AuthorizationProvider()),
        ],
        child: MaterialApp(
          scaffoldMessengerKey: Utils.messengerKey,
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          home: const MainPage(),
          routes: <String, WidgetBuilder>{
            '/loginScreen': (BuildContext context) => const LoginScreen(),
            '/registrationScreen': (BuildContext context) =>
                const RegistrationScreen(),
            '/accountScreen': (BuildContext context) => const AccountScreen(),
          },
        ),
      );
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text('Something went wrong!'),
                );
              } else if (snapshot.hasData) {
                return const BottomNavBar();
              } else {
                return const AuthPage();
              }
            }),
      );
}
