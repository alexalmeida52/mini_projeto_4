import 'dart:ffi';

import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;
  bool isCart;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
    this.isCart = false,
  });

  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  void toggleCart() {
    isCart = !isCart;
    notifyListeners();
  }

  void toggleCartForTrue() {
    isCart = true;
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['id']['title'],
      description: json['id']['description'],
      imageUrl: json['id']['imageUrl'],
      price: json['id']['price'],
    );
  }
}
