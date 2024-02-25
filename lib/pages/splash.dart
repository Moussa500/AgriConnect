// ignore_for_file: use_key_in_widget_constructors

import 'package:agriconnect/colors.dart';
import 'package:agriconnect/pages/login_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });

    return Scaffold(
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 60,),
                const Text(
                  "Welcome to",
                  style: TextStyle(
                    fontSize: 45,
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image.asset("assets/agrilogo.png", height: MediaQuery.of(context).size.width),
                const Text(
                  "Connect with fellow farmers and",
                  style: TextStyle(
                    fontSize: 25,
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Discover and share useful tips and tricks',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.50),
                    fontSize: 19,
                    fontWeight: FontWeight.normal,
                  ),
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
