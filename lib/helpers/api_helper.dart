import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/random_model.dart';

class APIHelper {
  APIHelper._();
  static final APIHelper apiHelper = APIHelper._();
  Future<random?> fetchData() async {
    String api = "https://randomuser.me/api/";
    http.Response res = await http.get(Uri.parse(api));

    if (res.statusCode == 200) {
      Map data = jsonDecode(res.body);

      random allData = random.fromJson(json: data);

      return allData;
    }
    return null;
  }
}
