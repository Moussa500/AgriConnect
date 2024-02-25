// ignore_for_file: avoid_print, file_names, use_super_parameters

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:agriconnect/button.dart';
import 'package:agriconnect/colors.dart';
import 'package:agriconnect/pages/textField.dart';
import 'package:string_validator/string_validator.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

String? email;
String? password;
String? name;
String? surname;
String? phoneNumber;

class _RegisterPageState extends State<RegisterPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double devicewidh = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                color: secondaryColor,
                height: devicewidh * 0.8,
                width: devicewidh,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/agrilogo.png",
                      height: 200,
                      width: 200,
                    ),
                    const Text(
                      "Agriconnect",
                      style: TextStyle(
                        fontSize: 34,
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Join today to connect with farmers and share agricultural knowledge!',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.50),
                        fontSize: 25,
                        fontWeight: FontWeight.normal,
                      ),
                      softWrap: true,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        save: (val) {
                          email = val;
                        },
                        labelText: 'Email',
                        obscure: false,
                        validate: (val) {
                          if (!val!.contains("@")) {
                            return "Please enter a valid email";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      CustomTextField(
                        save: (val) {
                          password = val;
                        },
                        labelText: 'Password',
                        obscure: true,
                        validate: (val) {
                          if (val!.length < 6) {
                            return "Please enter a password with at least 6 characters";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      CustomTextField(
                        save: (val) {
                          name = val;
                        },
                        labelText: 'Name',
                        obscure: false,
                        validate: (val) {
                          if (!isAlpha(val!)) {
                            return "please enter a valid name";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ],
                  )),
              const SizedBox(
                height: 35,
              ),
              CustomTextField(
                save: (val) {
                  surname = val;
                },
                labelText: 'Surname',
                obscure: false,
                validate: (val) {
                  if (!isAlpha(val!)) {
                    return "please enter a valid surname";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 35,
              ),
              CustomTextField(
                save: (val) {
                  phoneNumber = val;
                },
                labelText: 'Phone Number',
                obscure: false,
                validate: (val) {
                  if (!isNumeric(phoneNumber!) && (phoneNumber!.length != 8)) {
                    return "please enter a valid phone number";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    try {
                      UserCredential userCredential =
                          await _auth.createUserWithEmailAndPassword(
                        email: email!,
                        password: password!,
                      );
                      String userId = userCredential.user!.uid;
                      await FirebaseFirestore.instance
                          .collection('users')
                          .doc(userId)
                          .set({
                        'name': name,
                        'surname': surname,
                        'phone': phoneNumber,
                        'password': password,
                        'email': email,
                      });
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Congratulations!"),
                        backgroundColor: Colors.green,
                      ));
                      Navigator.pushNamed(context,'/homepage');
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Error occured during registration"),
                        backgroundColor: Colors.red,
                      ));
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
