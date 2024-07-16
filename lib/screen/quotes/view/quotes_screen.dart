import 'package:db_miner_app/screen/home/controller/home_controller.dart';
import 'package:db_miner_app/screen/home/model/home_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuotesScreen extends StatefulWidget {
  const QuotesScreen({super.key});

  @override
  State<QuotesScreen> createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  HomeController controller = Get.put(HomeController());
  List<Color> colors = [Colors.green, ...Colors.primaries];
  HomeModel m1 = Get.arguments;

  @override
  void initState() {
    super.initState();
    controller.getDate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${m1.category}"),
      ),
      body: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: m1.quotes!.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Get.toNamed(
                'detail',
                arguments: [m1.quotes![index], m1.author![index], m1.category],
              );
            },
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              color: colors[index] ,
              child: Text("${m1.quotes![index]}"),
            ),
          );
        },
      ),
    );
  }
}
