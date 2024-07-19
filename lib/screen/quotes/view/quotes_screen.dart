import 'package:db_miner_app/screen/home/controller/home_controller.dart';
import 'package:db_miner_app/screen/home/model/home_model.dart';
import 'package:db_miner_app/screen/quotes/controller/quotes_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuotesScreen extends StatefulWidget {
  const QuotesScreen({super.key});

  @override
  State<QuotesScreen> createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  HomeController controller = Get.put(HomeController());
  QuotesController quotesController = Get.put(QuotesController());
  List<Color> colors = [Colors.green, ...Colors.accents];
  HomeModel m1 = Get.arguments;

  @override
  void initState() {
    super.initState();
    controller.getJsonData();
    quotesController.readCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${m1.category}"),
        actions: [
          IconButton(
            onPressed: () {
              quotesController.insertCategory(m1.category!);

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Category added"),
                ),
              );
            },
            icon: const Icon(Icons.favorite),
          ),
        ],
      ),
      body: ListView.builder(
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
              height: 300,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: colors[index],
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${m1.quotes![index]}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                    maxLines: 2,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "Edit Text >>",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
