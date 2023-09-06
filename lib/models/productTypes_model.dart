import 'dart:ui';

import 'package:edf/Pages/catePage.dart';
import 'package:edf/globals.dart';
import 'package:edf/models/productCategory.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:edf/Pages/about.dart';
import 'package:edf/screens/order_placed_screen.dart';

class ProductTypes extends StatefulWidget {
  const ProductTypes(this.productCategory);
  final ProductCate productCategory;

  @override
  State<ProductTypes> createState() => _ProductTypesState();
}

class _ProductTypesState extends State<ProductTypes> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        selectedCate = widget.productCategory.name;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CatePage()),
        );
      },
      child: Container(
        width: 100,
        height: 100,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 62.85,
              height: 58.44,
              color: Color.fromRGBO(76, 161, 70, 1),
            ),
            Image.asset(widget.productCategory.imageUrl),
            Positioned(
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Text(
                  widget.productCategory.name,
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 11,
                      fontWeight: FontWeight.w800),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
