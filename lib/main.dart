import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wether_app/view/auth/login/login.dart';
import 'package:wether_app/view/home/home_screen.dart';
import 'package:wether_app/view/next-days/next_14_days.dart';
import 'package:wether_app/view/page-not-found/page_not_found.dart';
import 'package:wether_app/view/splash/splash_screen.dart';
import 'firebase_options.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      getPages: [
        GetPage(name: '/', page: () => const SplashScreen()),
        GetPage(name: '/Login', page: ()=> LoginScreen()),
        GetPage(name: '/HomeScreen', page: () => const HomeScreen()),
        GetPage(name: '/Next14Day', page: () => NextDays()),
        GetPage(name: '/404', page: ()=> NotFoundPage()),
      ],

    );
  }
}

