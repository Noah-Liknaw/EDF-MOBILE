import 'package:flutter/material.dart';
import 'dart:convert';

class Product {
  final String name;
  final String price;
  final String imageUrl;
  final String desc;
  int qty;

  Product(this.name, this.price, this.imageUrl, this.desc, this.qty);
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(json['product_name'], json["product_price"],
        json['product_image_url'], json['product_desc'], json['qty']);
  }
}
