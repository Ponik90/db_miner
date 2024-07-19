import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {
  static SharedHelper sharedHelper = SharedHelper._();

  SharedHelper._();

  Future<void> setTheme(bool themeData) async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    await shr.setBool('theme', themeData);
  }

  Future<bool> getTheme() async {
    bool? theme;
    SharedPreferences shr = await SharedPreferences.getInstance();
    theme = shr.getBool(
      'theme',
    )!;
    return theme;
  }
}
