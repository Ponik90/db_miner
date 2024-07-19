import 'package:db_miner_app/screen/quotes/controller/quotes_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  QuotesController controller = Get.put(QuotesController());

  @override
  void initState() {
    super.initState();
    controller.readCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite"),
      ),
      body: ListView.builder(
        itemCount: controller.categoryList.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Get.toNamed('favoriteqoutes');
            },
            title: Text("${controller.categoryList[index].name}"),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                controller.deleteCategory(controller.categoryList[index].id!);
              },
            ),
          );
        },
      ),
    );
  }
}
