import 'dart:io';

import 'package:db_miner_app/screen/detail/controller/detail_controller.dart';
import 'package:db_miner_app/screen/home/controller/home_controller.dart';
import 'package:db_miner_app/screen/quotes/controller/quotes_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';

import 'package:share_plus/share_plus.dart';
import 'dart:ui' as ui;

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  HomeController homeController = Get.put(HomeController());
  EditController editController = Get.put(EditController());
  QuotesController quotesController = Get.put(QuotesController());
  List l1 = Get.arguments;
  List<Color> bgColor = [Colors.white, Colors.black, ...Colors.primaries];
  GlobalKey repaintKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    homeController.getJsonData();
    quotesController.readCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Quotes"),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return quotesController.categoryList.isEmpty
                      ? Container(
                          height: 300,
                          width: MediaQuery.sizeOf(context).width,
                          alignment: Alignment.center,
                          child: const Text(
                            "No Category Here Please select category",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount: quotesController.categoryList.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              onTap: () {
                                editController.insertQuotes(l1[0], l1[1],);
                              },
                              title: Text(
                                  "${quotesController.categoryList[index].name}"),
                            );
                          },
                        );
                },
              );
            },
            icon: const Icon(Icons.favorite),
          ),
          IconButton(
            onPressed: () async {
              RenderRepaintBoundary boundry = repaintKey.currentContext!
                  .findRenderObject() as RenderRepaintBoundary;
              ui.Image image = await boundry.toImage();
              ByteData? byteData =
                  await image.toByteData(format: ui.ImageByteFormat.png);
              Uint8List data = byteData!.buffer.asUint8List();
              Directory dir = await getTemporaryDirectory();
              File f1 = await File("${dir.path}/image.jpg").writeAsBytes(data);
              await ImageGallerySaver.saveFile(f1.path);
              await Share.shareXFiles([XFile(f1.path)]);
            },
            icon: const Icon(Icons.share),
          ),
          IconButton(
            onPressed: () async {
              await Clipboard.setData(
                ClipboardData(text: l1[0]),
              );
            },
            icon: const Icon(Icons.copy),
          ),
        ],
      ),
      body: Column(
        children: [
          RepaintBoundary(
            key: repaintKey,
            child: Obx(
              () => Container(
                height: 300,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  color: editController.bgColor.value,
                  border: Border.all(
                    color: editController.borderColor.value,
                    width: 2,
                  ),
                ),
                child: Stack(
                  children: [
                    Visibility(
                      visible: editController.isImage.value,
                      child: Image.asset(
                        editController.bgImage.value,
                        height: 300,
                        width: MediaQuery.sizeOf(context).width,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Text(
                      "${l1[0]}",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: editController.txtColor.value,
                        fontFamily: editController.fontStyle.value,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
