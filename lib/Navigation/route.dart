import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wether_app/view/home/home_screen.dart';
import 'package:wether_app/view/next-days/next_14_days.dart';
import 'package:wether_app/view/page-not-found/page_not_found.dart';
import 'package:wether_app/view/splash/splash_screen.dart';

class RouteManager {
  static List<GetPage> routes = [
    GetPage(name: '/', page: () => const SplashScreen()),
    GetPage(name: '/HomeScreen', page: () => const HomeScreen()),
    GetPage(name: '/Next14Day', page: () => NextDays()),
  ];

  static Route<dynamic> genereteRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return GetPageRoute(
        page: () => SplashScreen(),
      );
    }
    if (settings.name == '/HomeScreen') {
      return GetPageRoute(
        page: () => HomeScreen(),
      );
    }
    if (settings.name == '/Next14Day') {
      return GetPageRoute(
        page: () => NextDays(),
      );
    }
    return GetPageRoute(
      page: () => NotFoundPage(),
    );
  }
}
