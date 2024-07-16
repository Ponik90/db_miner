import 'package:db_miner_app/screen/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  HomeController controller = Get.put(HomeController());
  List l1 = Get.arguments;

  @override
  void initState() {
    super.initState();
    controller.getDate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Quotes"),
      ),
      body: Text("${l1[0]}"),
    );
  }
}
