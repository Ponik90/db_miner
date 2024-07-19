import 'dart:convert';

import 'package:db_miner_app/screen/home/model/home_model.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  static ApiHelper apiHelper = ApiHelper._();

  ApiHelper._();

  Future<List<ApiHomeModel>?> getApi() async {
    String apiLink =
        "https://famous-quotes4.p.rapidapi.com/random?category=all&count=10";
    var response = await http.get(Uri.parse(apiLink), headers: {
      "x-rapidapi-host": " famous-quotes4.p.rapidapi.com",
      "x-rapidapi-key": "fe6e9f38fbmsh2178b2569ba87bbp1f23f5jsnef8e7376e3a9"
    });

    if (response.statusCode == 200) {
      List json = jsonDecode(response.body);
      List<ApiHomeModel> apiData =
          json.map((e) => ApiHomeModel.mapToModel(e)).toList();
      return apiData;
    }
    return null;
  }
}
