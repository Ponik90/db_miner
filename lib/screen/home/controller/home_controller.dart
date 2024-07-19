import 'package:db_miner_app/utils/helper/api_helper.dart';
import 'package:db_miner_app/utils/helper/json_helper.dart';
import 'package:db_miner_app/utils/helper/shared_helper.dart';
import 'package:get/get.dart';

import '../model/home_model.dart';

class HomeController extends GetxController {
  RxList<HomeModel> getQuotesList = <HomeModel>[].obs;
  Future<List<ApiHomeModel?>?>? getApiQuotesList;
  RxBool themeData = true.obs;

  Future<void> getJsonData() async {
    getQuotesList.value = await JsonHelper.jsonHelper.getJson();
  }

  Future<void> getTheme() async {
    themeData.value = await SharedHelper.sharedHelper.getTheme();
  }

  void getApiData() {
    getApiQuotesList; //= ApiHelper.apiHelper.getApi();
  }
}
