import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/data_model.dart';

class DataServices {
  String baseUrl = "https://localhost:7151/api/Todo";

  Future<List<DataModel>> getInfo(String token) async {
    var apiUrl = '/getTodos';

    http.Response res = await http.get(Uri.parse(baseUrl + apiUrl),
        headers: <String, String>{"Authorization": "Bearer $token"});
    try {
      if (res.statusCode == 200) {
        List<dynamic> list = json.decode(res.body);
        print(list);
        return list.map((e) => DataModel.fromJson(e)).toList();
      } else {
        return <DataModel>[];
      }
    } catch (e) {
      return <DataModel>[];
    }
  }
}
