import 'package:edf/globals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:edf/Pages/productDetail.dart';
import 'package:edf/models/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(this.product);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        selectedProduct = product;
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProductDetail()));
        ;
      },
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
          width: 100,
          height: 260,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.green, spreadRadius: 3),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(product.imageUrl),
              Text(
                product.name,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 11,
                    color: Colors.black),
              ),
              Text(
                product.price.toString() + " ETB",
                style: GoogleFonts.istokWeb(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: Colors.black),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (cart.contains(product)) {
                      Get.snackbar("Prodcut Already added to cart", "",
                          backgroundColor: Colors.green);
                    } else {
                      cart.add(product);
                      Get.snackbar("Prodcut Added To Cart", "Successfully!!",
                          backgroundColor: Colors.green);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    backgroundColor: Color.fromRGBO(4, 99, 4, 100),
                    foregroundColor: Colors.white,
                    minimumSize: Size(100, 28),
                  ),
                  child: Text(
                    "Add to cart",
                    style: GoogleFonts.poppins(
                        fontSize: 10, fontWeight: FontWeight.w500),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
