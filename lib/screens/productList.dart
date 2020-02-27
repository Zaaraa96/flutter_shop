import 'package:flutter/material.dart';
import 'package:new_app/components/product.dart';
import 'package:provider/provider.dart';
import 'package:new_app/screens/taskScreen.dart';

List<Color> backgroundColor = [
  Colors.redAccent,
  Colors.green.shade700,
  Colors.blueAccent,
  Colors.grey.shade800,
];
List<String> brand = [
  'Nike',
  'Nike',
  'Nike',
  'Nike',
];
List<String> model = [
  'AIR-270',
  'AIR-270',
  'AIR-270',
  'AIR-270',
];
List<String> price = [
  '\$150.00',
  '\$150.00',
  '\$150.00',
  '\$150.00',
];
List<String> url = [
  'images/shoe1.png',
  'images/shoe2.png',
  'images/shoe3.png',
  'images/shoe4.png',
];
//BuildContext context;
//List<Product> productList = [
//  Product(
//    backgroundColor: Colors.redAccent,
//    brand: 'Nike',
//    model: 'AIR-270',
//    price: '\$150.00',
//    url: 'images/shoe1.png',
//    xTranslate: Provider.of<Data>(context).xTranslate[0],
//  ),
//  Product(
//    backgroundColor: Colors.green.shade700,
//    brand: 'Nike',
//    model: 'AIR-270',
//    price: '\$150.00',
//    url: 'images/shoe2.png',
//    xTranslate: Provider.of<Data>(context).xTranslate[1],
//  ),
//  Product(
//    backgroundColor: Colors.blueAccent,
//    brand: 'Nike',
//    model: 'AIR-270',
//    price: '\$150.00',
//    url: 'images/shoe3.png',
//    xTranslate: Provider.of<Data>(context).xTranslate[2],
//  ),
//  Product(
//    backgroundColor: Colors.grey.shade800,
//    brand: 'Nike',
//    model: 'AIR-270',
//    price: '\$150.00',
//    url: 'images/shoe4.png',
//    xTranslate: Provider.of<Data>(context).xTranslate[3],
//  ),
//];
