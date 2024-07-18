import 'package:db_miner_app/screen/favorite/view/favorite_quotes_screen.dart';
import 'package:db_miner_app/screen/favorite/view/favorite_screen.dart';
import 'package:db_miner_app/screen/home/view/home_screen.dart';
import 'package:db_miner_app/screen/quotes/view/quotes_screen.dart';
import 'package:db_miner_app/screen/splash/view/splash_screen.dart';
import 'package:flutter/material.dart';

import '../screen/detail/view/detail_screen.dart';

Map<String, WidgetBuilder> screen = {
  '/': (context) => const SplashScreen(),
  'home': (context) => const HomeScreen(),
  'quotes': (context) => const QuotesScreen(),
  'detail': (context) => const DetailScreen(),
  'favorite': (context) => const FavoriteScreen(),
  'favoriteqoutes': (context) => const FavoriteQuotesScreen(),
};
