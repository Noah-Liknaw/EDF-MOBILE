import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:edf/Pages/SignUpPage.dart';
import 'package:edf/Pages/about.dart';
import 'package:edf/widgets/buildpassword.dart';
import '../utils/url.dart';
import 'buildEmail.dart';
import 'buildUsername.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth.dart';

final _formkey = GlobalKey<FormState>();

class SignUpRegisterBox extends StatefulWidget {
  @override
  State<SignUpRegisterBox> createState() => _SignUpRegisterBoxState();
}

class _SignUpRegisterBoxState extends State<SignUpRegisterBox> {
  String? errorMessage = '';
  bool isLogin = true;
  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordConfController = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordConfController.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
          email: _emailController.text, password: _passwordConfController.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordConfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.fromLTRB(23, 100, 23, 0),
          child: Container(
            color: Colors.white.withOpacity(0.95),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 47),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: 50,
                          height: 50,
                          child: Image.asset("assets/images/signUpImg1.png")),
                      Text(
                        "Register",
                        style: GoogleFonts.italiana(
                          textStyle: const TextStyle(fontSize: 58),
                          color: Colors.black,
                        ),
                      ),
                      Container(
                          width: 50,
                          height: 50,
                          child: Image.asset("assets/images/signUpImg2.png")),
                    ],
                  ),
                ),
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Text(
                              "User name",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600, fontSize: 23),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          height: 64,
                          child: TextFormField(
                            controller: _usernameController,
                            decoration: InputDecoration(
                              labelText: "Enter User name",
                              labelStyle: GoogleFonts.inriaSans(
                                  fontSize: 15,
                                  color: Color.fromRGBO(136, 136, 136, 100)),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 3, color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 3, color: Colors.black),
                              ),
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              errorStyle: TextStyle(color: Colors.black),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Username is required';
                              }
                              if (value.length < 6) {
                                return 'Username must be at least 6 characters long';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Text(
                              "Email",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600, fontSize: 23),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          height: 64,
                          child: TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: "Enter E-mail",
                              labelStyle: GoogleFonts.inriaSans(
                                  fontSize: 15,
                                  color: Color.fromRGBO(136, 136, 136, 100)),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 3, color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 3, color: Colors.black),
                              ),
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              errorStyle: TextStyle(color: Colors.black),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Email is required';
                              }
                              if (value.length < 6) {
                                return 'Email must be at least 6 characters long';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Text(
                              "Password",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600, fontSize: 23),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          height: 64,
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            enableSuggestions: false,
                            autocorrect: false,
                            decoration: InputDecoration(
                              labelText: "Enter Password",
                              labelStyle: GoogleFonts.inriaSans(
                                  fontSize: 15,
                                  color: Color.fromRGBO(136, 136, 136, 100)),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 3, color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 3, color: Colors.black),
                              ),
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              errorStyle: TextStyle(color: Colors.black),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password is required';
                              }
                              if (value.length < 8) {
                                return 'Password must be at least 8 characters long';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Text(
                              "Confirm password",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600, fontSize: 23),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          height: 64,
                          child: TextFormField(
                            obscureText: true,
                            enableSuggestions: false,
                            autocorrect: false,
                            decoration: InputDecoration(
                              labelText: "Enter Password",
                              labelStyle: GoogleFonts.inriaSans(
                                fontSize: 15,
                                color: const Color.fromRGBO(136, 136, 136, 100),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 3, color: Colors.black),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 3, color: Colors.black),
                              ),
                              errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              focusedErrorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              errorStyle: const TextStyle(color: Colors.black),
                            ),
                            controller: _passwordConfController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password is required';
                              }
                              // if (value != _passwordController.text) {
                              //   return 'Passwords do not match';
                              // }
                              if (value.length < 8) {
                                return 'Password must be at least 8 characters long';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 43.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            backgroundColor:
                                const Color.fromRGBO(4, 99, 4, 100),
                            foregroundColor: Colors.white,
                            minimumSize: const Size(258, 71),
                          ),
                          onPressed: () async {
                            if (_formkey.currentState!.validate()) {
                              print("made it");
                              addUserToFirebase(
                                  _usernameController.text,
                                  _emailController.text,
                                  _passwordController.text);
                              SnackBar(
                                content: Text('Made it'),
                                duration: Duration(seconds: 3),
                              );
                              Get.to(() => SignupPage());
                            }
                          },
                          child: Text("Sign Up",
                              style: GoogleFonts.poppins(
                                  fontSize: 28, fontWeight: FontWeight.w500)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => SignupPage());
                        },
                        child: const Text("Already have an account? Sign In",
                            style: TextStyle(fontSize: 18)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Future<void> addUserToFirebase(
      String name, String email, String password) async {
    try {
      // Get a reference to the "users" collection in Firestore
      CollectionReference usersRef =
          FirebaseFirestore.instance.collection('users');

      // Create a new document with an auto-generated ID
      DocumentReference newUserRef = usersRef.doc();

      // Set the data for the new user document
      await newUserRef.set({
        'name': name,
        'email': email,
        'password': password,
      });

      print('User added to Firebase successfully');
    } catch (e) {
      print('Error adding user to Firebase: $e');
    }
  }
}
