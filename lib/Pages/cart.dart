import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:edf/Pages/sdnav.dart';

import '../globals.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});
  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  void initState() {
    super.initState();
    getTotal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Dra(),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("My Cart"),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 7),
        child: Column(
          children: [
            Container(
              height: 500,
              child: ListView.builder(
                  itemCount: cart.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding:
                          const EdgeInsets.all(0), // Remove default padding
                      leading: Image.network(cart[index].imageUrl,
                          width: 50,
                          height: 50), // Adjust width and height as needed
                      title: Text(cart[index].name),
                      trailing: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius:
                                BorderRadius.all(Radius.circular(13))),
                        child: Row(
                          mainAxisSize: MainAxisSize
                              .min, // Ensure row takes minimum space
                          children: [
                            GestureDetector(
                              child: const Text(
                                "-",
                                style: TextStyle(
                                    fontSize: 24, color: Colors.white),
                              ),
                              onTap: () {
                                if (cart[index].qty > 1) {
                                  cart[index].qty--;
                                }
                              },
                            ),
                            Container(
                                margin: const EdgeInsets.all(3),
                                child: Text(cart[index].qty.toString())),
                            GestureDetector(
                              child: const Text(
                                "+",
                                style: TextStyle(
                                    fontSize: 24, color: Colors.white),
                              ),
                              onTap: () {
                                getTotal();
                                setState(() {
                                  ++cart[index].qty;
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Total    ",
                        style: TextStyle(fontSize: 24),
                      ),
                      SizedBox(),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "" + totalPrice.toStringAsFixed(3) + "ETB",
                            style: TextStyle(fontSize: 24),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                      child: Container(
                        width: 220,
                        height: 40,
                        decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: const Center(
                            child: Text(
                          "Buy now",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        )),
                      ),
                      onTap: () {
                        Get.snackbar("Success", "Bought items",
                            backgroundColor: Colors.green);
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void getTotal() {
    double total = 0;
    for (int i = 0; i < cart.length; i++) {
      total += (cart[i].qty * double.parse(cart[i].price));
    }
    totalPrice = total;
  }
}
