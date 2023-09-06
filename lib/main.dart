import 'package:edf/Pages/catePage.dart';
import 'package:edf/Pages/editProfile.dart';
import 'package:edf/data/product_data.dart';
import 'package:edf/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:edf/Pages/SignUpPage.dart';
import 'package:edf/Pages/about.dart';
import 'package:edf/Pages/onBoarding.dart';
import 'package:edf/Pages/productDetail.dart';
import 'package:edf/screens/order_placed_screen.dart';
import 'package:edf/widgets/signUpBackgroundImg.dart';
import 'Pages/SignInPage.dart';
import 'Pages/productList.dart';
import 'models/productTypes_model.dart';
import 'package:get/get.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'globals.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: ProductList(),
    );
  }
}
