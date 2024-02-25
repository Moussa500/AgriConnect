import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:agriconnect/button.dart';
import 'package:agriconnect/colors.dart';
import 'package:agriconnect/pages/textfield.dart';

class LoginPage extends StatefulWidget {
  // ignore: use_super_parameters
  const LoginPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email;
  String? password;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/agrilogo.png',
              height: MediaQuery.of(context).size.width,
            ),
            const Text(
              "Agriconnect",
              style: TextStyle(
                fontSize: 45,
                color: primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Connect with farmers and share',
              style: TextStyle(
                color: Colors.black.withOpacity(0.50),
                fontSize: 25,
                fontWeight: FontWeight.normal,
              ),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextField(
                    labelText: "Email",
                    obscure: false,
                    validate: (val) {
                      if (!(val!.contains('@'))) {
                        return "Please enter a valid email";
                      } else {
                        return null;
                      }
                    },
                    save: (val) {
                      email = val;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                    labelText: "Password",
                    obscure: true,
                    validate: (val) {
                      if (val!.isEmpty) {
                        return "Please enter a password";
                      } else {
                        return null;
                      }
                    },
                    save: (val) {
                      password = val;
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 29,
            ),
            CustomButton(onPressed: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                try {
                  UserCredential userCredential =
                      await _auth.signInWithEmailAndPassword(
                    email: email!,
                    password: password!,
                  );
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('signed in successfully'),
                    backgroundColor: Colors.green,
                  ));
                  // ignore: use_build_context_synchronously
                  Navigator.pushNamed(context, "/");
                } catch (e) {
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('error signing in'),
                    backgroundColor: Colors.red,
                  ));
                }
              }
            }),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Need an account ?",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/register');
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
