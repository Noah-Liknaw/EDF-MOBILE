import 'package:flutter/material.dart';
import 'dart:convert';

class Product {
  final String name;
  final String price;
  final String imageUrl;
  final String desc;
  final String category;
  int qty;

  Product(
      this.name, this.price, this.imageUrl, this.desc, this.qty, this.category);
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        json['product_name'],
        json["product_price"],
        json['product_image_url'],
        json['product_desc'],
        json['qty'],
        json['category']);
  }
}
