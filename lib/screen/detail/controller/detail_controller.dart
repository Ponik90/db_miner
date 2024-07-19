import 'package:db_miner_app/screen/detail/model/detail_model.dart';
import 'package:db_miner_app/utils/helper/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditController extends GetxController {
  List<Color> bgColorList = [
    Colors.green,
    Colors.red,
    Colors.blue,
    Colors.purple,
    ...Colors.primaries
  ];
  Rx<Color> bgColor = Colors.blue.obs;

  List<Color> borderColorList = [
    Colors.green,
    Colors.red,
    Colors.blue,
    Colors.purple,
    ...Colors.primaries
  ];
  Rx<Color> borderColor = Colors.blue.obs;

  List<String> bgImageList = [
    "assets/bgImage/bg1.jpg",
    "assets/bgImage/bg3.jpg",
    "assets/bgImage/bg4.jpg",
    "assets/bgImage/bg5.jpg",
    "assets/bgImage/bg6.jpg"
  ];
  RxString bgImage = "assets/bgImage/bg1.jpg".obs;
  RxBool isImage = false.obs;
  RxBool isText = true.obs;
  Rx<Color> txtColor = Colors.black.obs;
  RxnString shortBy = RxnString();

  List<String> fontStyleList = ["edu", "teko"];
  RxnString fontStyle = RxnString();

  RxList<DetailModel> quotesList = <DetailModel>[].obs;
  List<DetailModel> filterList = <DetailModel>[];

  Future<void> getQuotesData() async {
    quotesList.value = await DbHelper.dbHelper.readQuotes();
  }

  void insertQuotes(String quote, String author, String category) {
    DbHelper.dbHelper.insertQuotes(quote, author, category);
    getQuotesData();
  }

  void deleteQuotes(int id) {
    DbHelper.dbHelper.deleteQuotes(id);
    getQuotesData();
  }

  Future<void> filterData(String value) async {
    shortBy.value = value;
    filterList = await DbHelper.dbHelper.filterTransaction(shortBy.value!);
    quotesList.value = filterList;
  }
}
