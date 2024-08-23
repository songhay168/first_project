import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'rdmUser_Model.dart';

class RdmUserService {
  static Future<RdmUserModel> fechData() async {
    http.Response response = await http.get(Uri.parse(
        "https://randomuser.me/api?results=100&seed=a90259128b34dafd"));
    // return compute(_convertData, response.body);
    return compute(rdmUserModelFromJson, response.body);
  }
}



// List<Map<String, dynamic>> _convertData(String body) {
//   List list = json.decode(body);

//   List<Map<String, dynamic>> products =
//       list.map((x) => x as Map<String, dynamic>).toList();
//   return products;
// }
