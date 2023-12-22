import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:ibaapp/models/user_model.dart';

class UserApiClient {
  Future<List<ProductModel>> fetchuser() async {
    List<ProductModel> prolist = [];

    try {
      final pro = await FirebaseFirestore.instance.collection("products").get();

      pro.docs.forEach((element) {
        prolist
            .add(ProductModel.fromJson(element.data() as Map<String, dynamic>));
      });
      return prolist;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("Failed with error ${e.code}: ${e.message}");
      }
      throw Exception("Failed with error ${e.code}: ${e.message}");
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
