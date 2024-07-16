import 'package:db_miner_app/screen/home/controller/home_controller.dart';
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
    controller.getDate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomeScreen"),
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
                      //offset: const Offset(3, 3),
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
      ),
    );
  }
}
