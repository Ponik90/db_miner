import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditController extends GetxController {
  List<Color> bgColorList = [
    Colors.green,
    Colors.red,
    Colors.blue,
    Colors.purple,
    ...Colors.primaries
  ];
  Rx<Color> bgColor = Colors.blue.obs;

  List<Color> borderColorList = [
    Colors.green,
    Colors.red,
    Colors.blue,
    Colors.purple,
    ...Colors.primaries
  ];
  Rx<Color> borderColor = Colors.blue.obs;

  List<String> bgImageList = [
    "assets/bgImage/bg1.jpg",
    "assets/bgImage/bg3.jpg",
    "assets/bgImage/bg4.jpg",
    "assets/bgImage/bg5.jpg",
    "assets/bgImage/bg6.jpg"
  ];
  RxString bgImage = "assets/bgImage/bg1.jpg".obs;
  RxBool isImage = false.obs;
  RxBool isText = true.obs;
  Rx<Color> txtColor = Colors.black.obs;

  List<String> fontStyleList = ["edu", "teko"];
  RxnString fontStyle = RxnString();
}
