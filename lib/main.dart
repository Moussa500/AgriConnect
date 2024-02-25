import 'package:agriconnect/firebase_options.dart';
import 'package:agriconnect/pages/home_page.dart';
import 'package:agriconnect/pages/Register_page.dart';
import 'package:agriconnect/pages/login_page.dart';
import 'package:agriconnect/pages/messenger.dart';
import 'package:agriconnect/pages/nav_bar.dart';
import 'package:agriconnect/pages/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => const SplashScreen(),
        "/": (context) => const RootScreen(),
        "/register": (context) => const RegisterPage(),
        "/login": (context) => const LoginPage(),
        "/homepage": (context) => const HomePage(),
        "/messenger": (context) => const Messenger(),
        "profile": (context) => const Messenger(),
      },
    );
  }
}
