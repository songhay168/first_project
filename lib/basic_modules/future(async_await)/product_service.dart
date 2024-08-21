import 'dart:convert';

import 'package:first_project/basic_modules/future(async_await)/product_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ProductService {
  static Future<List<ProductModel>> fechData() async {
    http.Response response =
        await http.get(Uri.parse("https://fakestoreapi.com/products"));
    // return compute(_convertData, response.body);
    return compute(fakeProductModelFromJson, response.body);
  }
}



// List<Map<String, dynamic>> _convertData(String body) {
//   List list = json.decode(body);

//   List<Map<String, dynamic>> products =
//       list.map((x) => x as Map<String, dynamic>).toList();
//   return products;
// }
