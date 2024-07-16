import 'package:flutter/material.dart';
import 'package:db_miner_app/utils/app_routes.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: screen,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
    ),
  );
}
