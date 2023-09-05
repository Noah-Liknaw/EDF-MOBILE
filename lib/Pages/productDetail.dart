import 'dart:ui';

import 'package:edf/globals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'sdnav.dart';
// import 'package:woft_1st_project/Pages/about.dart';
// import 'package:woft_1st_project/screens/order_placed_screen.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(4, 100, 4, 100),
          title: Text(
            "Product Detail",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(fontSize: 18),
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(children: <Widget>[
                FractionallySizedBox(
                  child: Image.asset(
                    "assets/images/product-detail-bg-temp.png",
                    alignment: Alignment.center,
                    fit: BoxFit.fill,
                  ),
                  widthFactor: 1.0,
                ),
                FractionallySizedBox(
                  child: Image.network(
                    selectedProduct.imageUrl,
                    alignment: Alignment.center,
                  ),
                  widthFactor: 1.0,
                )
              ]),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      selectedProduct.name,
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(fontSize: 18),
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      selectedProduct.price + " ETB",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(fontSize: 15),
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(selectedProduct.desc),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: ElevatedButton(
                    onPressed: () {
                      if (cart.contains(selectedProduct)) {
                        Get.snackbar("Prodcut Already added to cart", "",
                            backgroundColor: Colors.green);
                      } else {
                        cart.add(selectedProduct);
                        Get.snackbar("Prodcut Added To Cart", "Successfully!!",
                            backgroundColor: Colors.green);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      backgroundColor: const Color.fromRGBO(4, 99, 4, 100),
                      foregroundColor: Colors.white,
                      minimumSize: const Size(350, 51),
                    ),
                    child: Text(
                      "Add to cart",
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    )),
              )
            ],
          ),
        ));
  }
}
