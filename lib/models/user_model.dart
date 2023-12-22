import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String title;
  final String price;
  final Timestamp Date;
  // final String icon_data;

  ProductModel({
    required this.title,
    required this.price,
    required this.Date,
    // required this.icon_data
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      title: json['title'],
      price: json['price'],
      Date: json['Date'],
      // icon_data: json['icon_data']
    );
  }
}
