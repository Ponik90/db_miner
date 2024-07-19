import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List<Color> colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];
  TextStyle colorizeTextStyle = const TextStyle(
    fontSize: 30.0,
    fontFamily: 'Horizon',
  );

  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 5),
      () {
        Get.offAllNamed('home');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedTextKit(
          animatedTexts: [
            ColorizeAnimatedText(
              'Find your Quotes',
              textStyle: colorizeTextStyle,
              colors: colorizeColors,
              speed: const Duration(seconds: 1),
            ),
          ],
          repeatForever: true,
        ),
      ),
    );
  }
}
