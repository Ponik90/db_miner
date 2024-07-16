import 'dart:convert';

import 'package:flutter/services.dart';

import '../../screen/home/model/home_model.dart';

class JsonHelper {
  Future<List<HomeModel>> getJson() async {
    String jsonString = await rootBundle.loadString("assets/json/quotes.json");
    List json = jsonDecode(jsonString);

    List<HomeModel> data = json.map((e) => HomeModel.mapToModel(e)).toList();
    return data;
  }
}
