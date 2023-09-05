import 'dart:ui';

import 'package:edf/models/productCategory.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import the Cloud Firestore package
import 'package:edf/Pages/sdnav.dart';
import 'package:edf/models/product.dart';

import '../globals.dart';
import '../models/productCard.dart';
import '../models/productTypes_model.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product> products = []; // Initialize an empty list of products

  @override
  void initState() {
    super.initState();
    fetchProducts(); // Call the method to fetch the products when the widget is initialized
  }

  Future<void> fetchProducts() async {
    try {
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection(
              'product') // Replace 'products' with the actual collection name in your Firestore database
          .get();

      if (snapshot.docs.isNotEmpty) {
        final List<Product> fetchedProducts = snapshot.docs.map((doc) {
          final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          return Product(
              data['name'], data['price'], data['picture'], data['desc'], 1);
        }).toList();

        setState(() {
          products =
              fetchedProducts; // Update the products list with the fetched products
        });
      } else {
        var snackBar = SnackBar(
          content: Text("NO PRODUCTS FOUND"),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 15),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (error) {
      print('Error fetching products: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Dra(),
      appBar: AppBar(
        title: const Text("Welcome page"),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Color.fromRGBO(4, 99, 4, 1),
                Color.fromRGBO(76, 161, 70, 1),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                FractionallySizedBox(
                  widthFactor: 1.0,
                  child: Image.asset("assets/images/bg for product detail.png"),
                ),
                FractionallySizedBox(
                  widthFactor: 1.0,
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      children: [
                        Text(
                          "Welcome to Ethiopian Digital Farmers",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "Join us on our mission to shape the future of agriculture. See more for today and unlock a world of possibilities for your farming endeavors. Together, let’s cultivate a brighter future for agriculture!",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 11,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text("Learn more"),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            backgroundColor:
                                const Color.fromRGBO(4, 99, 4, 100),
                            foregroundColor: Colors.white,
                            minimumSize: const Size(151, 35),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: FractionallySizedBox(
                    widthFactor: 1.0,
                    child: Text(
                      "Top Categories",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w700,
                        fontSize: 17,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ProductTypes(ProductCate(
                          name: "Groecries",
                          imageUrl: "assets/category-images/Groecries.png")),
                      ProductTypes(ProductCate(
                          name: "Vegetables",
                          imageUrl: "assets/category-images/Vegetables.png")),
                      ProductTypes(ProductCate(
                          name: "Fruits",
                          imageUrl: "assets/category-images/Fruits.png")),
                      ProductTypes(ProductCate(
                          name: "Beverages",
                          imageUrl: "assets/category-images/Beverages.png")),
                      ProductTypes(ProductCate(
                          name: "Teas",
                          imageUrl: "assets/category-images/tea.png")),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: FractionallySizedBox(
                widthFactor: 1.0,
                child: Text(
                  "Top Products",
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Container(
              height: 250,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 8.0,
                  mainAxisExtent: 235,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProductCard(products[index]);
                },
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Image.asset("assets/advertisement.png"))
          ],
        ),
      ),
    );
  }
}
