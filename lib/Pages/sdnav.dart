import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:edf/Pages/cart.dart';
import 'package:edf/Pages/productList.dart';

import '../screens/order_placed_screen.dart';
import 'SignUpPage.dart';
import 'about.dart';
import 'package:get/get.dart';
import 'editProfile.dart';

class Dra extends StatefulWidget {
  const Dra({super.key});

  @override
  State<Dra> createState() => _DraState();
}

class _DraState extends State<Dra> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: const Color.fromARGB(255, 62, 151, 65),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 4.0,
                    ),
                  ],
                  image: const DecorationImage(
                      image: AssetImage('assets/images/veggiesback.png'),
                      fit: BoxFit.cover)),
              child: Stack(
                children: [
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Image.network(
                      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png',
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.person_3_rounded,
                color: Colors.white70,
              ),
              title: const Text(
                'My profile',
                style: TextStyle(color: Colors.white70, fontSize: 20),
              ),
              onTap: () {
                Get.to(Editprofile());
                //           Navigator.push(
                // context,
                // MaterialPageRoute(builder: (context) => const MyProfile()),
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.shopping_bag_rounded,
                color: Colors.white70,
              ),
              title: const Text(
                'Shop',
                style: TextStyle(color: Colors.white70, fontSize: 20),
              ),
              onTap: () {
                Get.to(ProductList());
                //            Navigator.push(
                //  context,
                //  MaterialPageRoute(builder: (context) => const ProductList()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.shopping_cart_checkout_rounded,
                color: Colors.white70,
              ),
              title: const Text(
                'My Cart',
                style: TextStyle(color: Colors.white70, fontSize: 20),
              ),
              onTap: () {
                Get.to(MyCart());
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.info_rounded,
                color: Colors.white70,
              ),
              title: const Text(
                'About us',
                style: TextStyle(color: Colors.white70, fontSize: 20),
              ),
              onTap: () {
                Get.to(AboutPage());
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.logout_rounded,
                color: Colors.white70,
              ),
              title: const Text(
                'Logout',
                style: TextStyle(color: Colors.white70, fontSize: 20),
              ),
              onTap: () {
                // the erase the login data

                Get.to(SignupPage());
              },
            ),
          ],
        ));
  }
}
