import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WallpaperScreen extends StatefulWidget {
  const WallpaperScreen({super.key});

  @override
  State<WallpaperScreen> createState() => _WallpaperScreenState();
}

class _WallpaperScreenState extends State<WallpaperScreen> {
  String? f1 = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Set as wallpaper"),
      ),
      body: Image.file(File(
        "$f1",
      )),
    );
  }
}
