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
    controller.getApiData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("HomeScreen"),
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed('favorite');
              },
              icon: const Icon(Icons.favorite),
            ),

            Obx(
              () => Switch(value: controller.themeData.value, onChanged: (value) {
                SharedHelper.sharedHelper.setTheme(value);
                controller.getTheme();
              },),
            )

          ],
        ),
        body: Obx(
          () => ListView.builder(
            itemCount: controller.getQuotesList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.toNamed('quotes',
                      arguments: controller.getQuotesList[index]);
                },
                child: Container(
                  height: 80,
                  margin: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: colors[index],
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: colors[index],
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  child: Text(
                    "${controller.getQuotesList[index].category}",
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
              );
            },
          ),
        ));
  }
}
/*
FutureBuilder(
        future: controller.getApiQuotesList,
        builder: (context, snapshot) {
          List<ApiHomeModel?>? data = snapshot.data;
          if (snapshot.hasError) {
            return Text("data");
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: data!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.toNamed('quotes',
                        arguments: data[index]);
                  },
                  child: Container(
                    height: 80,
                    margin: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: colors[index],
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: colors[index],
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: Text(
                      "${data[index]!.category}",
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
*/
