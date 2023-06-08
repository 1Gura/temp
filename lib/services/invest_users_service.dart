import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:temp/model/account_model.dart';

class InvestUsersService {
  String baseUrl = "https://localhost:7151/api/UsersInvestInfo";

  Future<List<AccountModel>> getInfoUserAccounts() async {
    var apiUrl = '/getInfoUserAccounts';

    http.Response res = await http.get(Uri.parse(baseUrl + apiUrl));
    try {
      if (res.statusCode == 200) {
        List<dynamic> list = json.decode(res.body);
        print(list);
        return list.map((e) => AccountModel.fromJson(e)).toList();
      } else {
        return <AccountModel>[];
      }
    } catch (e) {
      print(e);
      return <AccountModel>[];
    }
  }
}
