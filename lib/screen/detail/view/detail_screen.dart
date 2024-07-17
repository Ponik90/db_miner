import 'dart:ffi';

import 'package:db_miner_app/screen/detail/controller/edit_controller.dart';
import 'package:db_miner_app/screen/home/controller/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  HomeController homeController = Get.put(HomeController());
  EditController editController = Get.put(EditController());
  List l1 = Get.arguments;
  List<Color> bgColor = [Colors.white, Colors.black, ...Colors.primaries];

  @override
  void initState() {
    super.initState();
    homeController.getJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Quotes"),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Obx(
                () => editController.isImage.value == true
                    ? Image.asset(
                        editController.bgImage.value,
                        height: 300,
                        width: MediaQuery.sizeOf(context).width,
                        fit: BoxFit.fill,
                      )
                    : Container(
                        height: 300,
                        decoration: BoxDecoration(
                          color: editController.bgColor.value,
                          border: Border.all(
                            color: editController.borderColor.value,
                            width: 2,
                          ),
                        ),
                      ),
              ),
              Obx(
                () => SelectableText(
                  "${l1[0]}",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: editController.txtColor.value,
                      fontFamily: editController.fontStyle.value,
                      fontSize: 30),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton.extended(
                heroTag: 'a1',
                onPressed: () {
                  editController.isText.value = false;
                },
                label: const Text("Text"),
                icon: const Icon(Icons.text_format_sharp),
              ),
              const SizedBox(
                width: 20,
              ),
              FloatingActionButton.extended(
                heroTag: 'a2',
                onPressed: () {
                  editController.isText.value = true;
                },
                label: const Text("Background"),
                icon: const Icon(Icons.image_sharp),
              ),
            ],
          ),
          Obx(
            () => Visibility(
              visible: !editController.isText.value,
              child: Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Change Text Color ",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 50,
                          child: ListView.builder(
                            itemCount: editController.bgColorList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  setState(
                                    () {
                                      editController.txtColor.value =
                                          editController.bgColorList[index];
                                    },
                                  );
                                },
                                child: Container(
                                  width: 50,
                                  margin: const EdgeInsets.only(
                                    right: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    color: editController.bgColorList[index],
                                    border: Border.all(
                                      width: 2,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Change Font Style",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 50,
                          child: ListView.builder(
                            itemCount: editController.fontStyleList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  setState(
                                    () {
                                      editController.fontStyle.value =
                                          editController.fontStyleList[index];
                                    },
                                  );
                                },
                                child: Container(
                                  width: 80,
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.only(
                                    right: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 2,
                                    ),
                                  ),
                                  child: Text(
                                    "Hello",
                                    style: TextStyle(
                                      fontFamily:
                                          editController.fontStyleList[index],
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Obx(
            () => Visibility(
              visible: editController.isText.value,
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Change Background",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: ListView.builder(
                          itemCount: editController.bgColorList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                editController.isImage.value = false;
                                editController.bgColor.value =
                                    editController.bgColorList[index];
                              },
                              child: Container(
                                width: 50,
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: editController.bgColorList[index],
                                  border: Border.all(
                                      color: Colors.black, width: 1.5),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const Text(
                        "Change Border",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: ListView.builder(
                          itemCount: editController.borderColorList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                editController.borderColor.value =
                                    editController.borderColorList[index];
                              },
                              child: Container(
                                width: 50,
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: editController.borderColorList[index],
                                  border: Border.all(
                                      color: Colors.black, width: 1.5),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const Text(
                        "Change Background Image",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 100,
                        child: ListView.builder(
                          itemCount: editController.bgImageList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                editController.isImage.value = true;
                                editController.bgImage.value =
                                    editController.bgImageList[index];
                              },
                              child: Container(
                                width: 100,
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1.5,
                                  ),
                                ),
                                child: Image.asset(
                                  editController.bgImageList[index],
                                  fit: BoxFit.fill,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
