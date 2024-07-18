import 'package:db_miner_app/utils/helper/api_helper.dart';
import 'package:db_miner_app/utils/helper/json_helper.dart';
import 'package:get/get.dart';

import '../model/home_model.dart';

class HomeController extends GetxController {
  RxList<HomeModel> getQuotesList = <HomeModel>[].obs;
  Future<List<ApiHomeModel?>?>? getApiQuotesList;

  Future<void> getJsonData() async {
    getQuotesList.value = await JsonHelper.jsonHelper.getJson();
  }

 void getApiData() {
    getApiQuotesList; //= ApiHelper.apiHelper.getApi();
  }
}
