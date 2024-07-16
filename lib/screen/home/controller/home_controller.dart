import 'package:db_miner_app/utils/helper/json_helper.dart';
import 'package:get/get.dart';

import '../model/home_model.dart';

class HomeController extends GetxController {
  RxList<HomeModel> getQuotesList = <HomeModel>[].obs;

  Future<void> getDate() async {
    JsonHelper helper = JsonHelper();
    getQuotesList.value = await helper.getJson();
  }
}
