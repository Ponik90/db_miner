import 'package:db_miner_app/utils/helper/db_helper.dart';
import 'package:get/get.dart';

import '../../detail/model/detail_model.dart';
import '../model/quotes_model.dart';

class QuotesController extends GetxController {
  RxList<QuotesModel> categoryList = <QuotesModel>[].obs;
  RxList<DetailModel> quotesList = <DetailModel>[].obs;
  Future<void> getQuotesData() async {
    quotesList.value = await DbHelper.dbHelper.readQuotes();
  }

  void insertQuotes(String quote, String author) {
    DbHelper.dbHelper.insertQuotes(quote, author, category);
    getQuotesData();
  }

  Future<void> readCategory() async {
    categoryList.value = await DbHelper.dbHelper.readCategory();
  }

  void insertCategory(String name) {
    DbHelper.dbHelper.insertCategory(name);
    readCategory();
  }
}
