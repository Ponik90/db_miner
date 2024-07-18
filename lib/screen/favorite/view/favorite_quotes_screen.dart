import 'package:db_miner_app/screen/detail/controller/detail_controller.dart';
import 'package:db_miner_app/screen/quotes/controller/quotes_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteQuotesScreen extends StatefulWidget {
  const FavoriteQuotesScreen({super.key});

  @override
  State<FavoriteQuotesScreen> createState() => _FavoriteQuotesScreenState();
}

class _FavoriteQuotesScreenState extends State<FavoriteQuotesScreen> {
  QuotesController controller = Get.put(QuotesController());
  EditController editController = Get.put(EditController());

  @override
  void initState() {
    super.initState();
    controller.readCategory();
    editController.getQuotesData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite"),
      ),
      body: Obx(
            () => ListView.builder(
          itemCount: controller.categoryList.length,
          itemBuilder: (context, index) {
            return ExpansionTile(
              title: Text("${controller.categoryList[index].name}"),
              children: const [
                Text(""),
              ],
            );
          },
        ),
      ),
    );
  }
}
