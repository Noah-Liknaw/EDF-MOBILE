import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edf/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/product.dart';
import '../models/productCard.dart';

class CatePage extends StatefulWidget {
  const CatePage({super.key});

  @override
  State<CatePage> createState() => _CatePageState();
}

class _CatePageState extends State<CatePage> {
  List<Product> products = []; // Initialize an empty list of products

  @override
  void initState() {
    super.initState();
    fetchProductsByCate();
  }

  Future<void> fetchProductsByCate() async {
    try {
      final QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('product').get();

      if (snapshot.docs.isNotEmpty) {
        final List<Product> fetchedProducts = snapshot.docs.map((doc) {
          final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          return Product(data['name'], data['price'], data['picture'],
              data['desc'], 1, "temp");
        }).toList();

        setState(() {
          for (Product i in fetchedProducts) {
            if (fruitCate.contains(i.name)) {
              products.add(i);
            }
          }
          // products =
          //     fetchedProducts; // Update the products list with the fetched products
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
      appBar: AppBar(
          toolbarHeight: 80,
          leading: IconButton(
              icon: Image.asset("assets/backIcon.png"),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: Text(
            selectedCate,
            style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 22,
                fontWeight: FontWeight.w700),
          ),
          backgroundColor: Color(0xFF55AB60)),
      body: products.isNotEmpty
          ? GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 8.0,
                mainAxisExtent: 200,
              ),
              scrollDirection: Axis.vertical,
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                return ProductCard(products[index]);
              },
            )
          : Center(
              child: Text(
                'Not connected to internet',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
    );
  }
}
