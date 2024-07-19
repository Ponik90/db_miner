import 'package:db_miner_app/utils/helper/db_helper.dart';
import 'package:get/get.dart';
import '../model/quotes_model.dart';

class QuotesController extends GetxController {
  RxList<QuotesModel> categoryList = <QuotesModel>[].obs;

  Future<void> readCategory() async {
    categoryList.value = await DbHelper.dbHelper.readCategory();
  }

  void insertCategory(String name) {
    DbHelper.dbHelper.insertCategory(name);
    readCategory();
  }

  void deleteCategory(int id)
  {
    DbHelper.dbHelper.deleteCategory(id);
    readCategory();
  }
}
