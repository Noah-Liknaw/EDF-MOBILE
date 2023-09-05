import 'package:flutter/material.dart';
import 'package:edf/Pages/SignUpPage.dart';
import 'package:edf/widgets/signUpBackgroundImg.dart';
import 'package:edf/widgets/signUpLoginBox.dart';
import 'package:edf/widgets/signUpRegisterBox.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [SignUpBackgroundImage(), SignUpRegisterBox()],
      ),
    );
  }
}
