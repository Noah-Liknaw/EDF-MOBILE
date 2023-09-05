import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edf/globals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:edf/Pages/SignInPage.dart';
import 'package:edf/Pages/SignUpPage.dart';
import 'package:edf/Pages/about.dart';
import 'package:edf/Pages/productList.dart';
import 'package:edf/widgets/buildpassword.dart';

import 'buildUsername.dart';

final _formkey = GlobalKey<FormState>();

class signUpLoginBox extends StatefulWidget {
  const signUpLoginBox({super.key});

  @override
  State<signUpLoginBox> createState() => _signUpLoginBoxState();
}

class _signUpLoginBoxState extends State<signUpLoginBox> {
  final TextEditingController _passwordControllerr = TextEditingController();

  final TextEditingController _usernameControllerr = TextEditingController();
  String name = "";
  String passwd = "";
  bool userExists = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(23, 170, 23, 0),
        child: Container(
          height: 550,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.95),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0),
              )),
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
                      "Log in",
                      style: GoogleFonts.italiana(
                        textStyle: const TextStyle(fontSize: 68),
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
                            controller: _usernameControllerr,
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
                              name = value.toString();
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
                              "Password",
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
                            controller: _passwordControllerr,
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
                              passwd = value.toString();
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
                        padding: const EdgeInsets.symmetric(vertical: 43.0),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              checkUserExists(name, passwd);

                              print(name + " name " + passwd + " yoooooooooo");
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            backgroundColor: Color.fromRGBO(4, 99, 4, 100),
                            foregroundColor: Colors.white,
                            minimumSize: Size(258, 71),
                          ),
                          child: Text(
                            'Submit',
                            style: GoogleFonts.poppins(
                                fontSize: 28, fontWeight: FontWeight.w500),
                          ),
                        ),
                      )
                    ],
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Forgot your password?",
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? Sign Up",
                    textAlign: TextAlign.center,
                  ),
                  GestureDetector(
                      child: Text(" Sign Up",
                          style: TextStyle(
                            color: Colors.blue,
                          )),
                      onTap: () {
                        Get.to(SigninPage());
                      })
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> checkUserExists(String name, String passwd) async {
    try {
      // Get a reference to the "users" collection in Firestore
      CollectionReference usersRef =
          FirebaseFirestore.instance.collection('users');

      // Query for a document that matches the provided name and email
      QuerySnapshot querySnapshot = await usersRef
          .where('name', isEqualTo: name)
          .where('password', isEqualTo: passwd)
          .limit(1)
          .get();

      // Check if any documents were found
      bool userExist = querySnapshot.docs.isNotEmpty;
      print("before " + userExists.toString());
      print("user exist " + userExist.toString());
      userExists = userExist;
      print("after " + userExist.toString());
      if (userExists) {
        print("user exists");
        userNameGlobal = name;
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ProductList()));
      } else {
        print("Doesn't exists");
        display("Incorrect user name or password.");
      }
      return userExist;
    } catch (e) {
      print('Error checking user in Firebase: $e');
      return false;
    }
  }

  void display(String value) {
    var snackBar = SnackBar(
      content: Text(value),
      backgroundColor: Colors.green,
      duration: Duration(seconds: 7),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
