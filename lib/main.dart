import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wether_app/Navigation/route.dart';
import 'package:wether_app/view/home/home_screen.dart';
import 'package:wether_app/view/next-days/next_14_days.dart';
import 'package:wether_app/view/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
     initialRoute: '/',
     // onGenerateRoute: RouteManager.genereteRoute,
     // home: const SplashScreen()
      getPages: [
        GetPage(name: '/', page: () => const SplashScreen()),
        GetPage(name: '/HomeScreen', page: () => const HomeScreen()),
        GetPage(name: '/Next14Day', page: () => NextDays()),
      ],
    );
  }
}

