import 'package:edf/models/product.dart';
import 'package:edf/models/productCategory.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final myGlobalVariableProvider = Provider<String>((ref) {
  // Provide the initial value of your global variable
  return 'Initial value';
});

String userNameGlobal = "AbebeBeso";
Product selectedProduct = Product("name", "price", "imageUrl", "desc", 1);

List<Product> cart = [];
double totalPrice = 0;

const List<ProductCate> catList = [
  const ProductCate(
      name: "Groecries", imageUrl: "category-images/Groecries.png"),
];

String selectedCate = "";
