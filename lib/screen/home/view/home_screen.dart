import 'package:db_miner_app/screen/home/controller/home_controller.dart';
import 'package:db_miner_app/utils/helper/shared_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.put(HomeController());
  List<Color> colors = [Colors.green, ...Colors.primaries];

  @override
  void initState() {
    super.initState();
    controller.getJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Best Quotes"),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed('favorite');
            },
            icon: const Icon(Icons.favorite),
          ),
          Obx(
            () => Switch(
              activeColor: Colors.white,
              activeTrackColor: Colors.green,
              inactiveTrackColor: Colors.green.shade200,
              value: controller.themeData.value,
              onChanged: (value) {
                SharedHelper.sharedHelper.setTheme(value);
                controller.getTheme();
              },
            ),
          )
        ],
      ),
      body: Obx(
        () => GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisExtent: 120),
          itemCount: controller.getQuotesList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Get.toNamed('quotes',
                    arguments: controller.getQuotesList[index]);
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: colors[index],
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: colors[index],
                      blurRadius: 1,
                    ),
                  ],
                ),
                child: Text(
                  "${controller.getQuotesList[index].category}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
