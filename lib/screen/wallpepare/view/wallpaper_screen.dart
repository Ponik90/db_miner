import 'dart:io';

import 'package:async_wallpaper/async_wallpaper.dart';
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
      body: Image.file(
        File(f1!),
        fit: BoxFit.fitHeight,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade400,
        onPressed: () {
          AsyncWallpaper.setWallpaper(
            url: "$f1",
            goToHome: true,
            toastDetails: ToastDetails.success(),
            errorToastDetails: ToastDetails.error(),
            wallpaperLocation: AsyncWallpaper.HOME_SCREEN,
          );
        },
        child: const Icon(
          Icons.download,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  void dispose() {
    f1!.isEmpty;
    super.dispose();
  }
}
