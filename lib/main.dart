import 'package:db_miner_app/screen/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:db_miner_app/utils/app_routes.dart';
import 'package:get/get.dart';

HomeController controller = Get.put(HomeController());

void main() {
  controller.getTheme();
  runApp(
    Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        routes: screen,
        theme: ThemeData(
          brightness: Brightness.light,
        ),
        darkTheme: ThemeData(brightness: Brightness.dark),
        themeMode: controller.themeData.value == true
            ? ThemeMode.light
            : ThemeMode.dark,
      ),
    ),
  );
}
