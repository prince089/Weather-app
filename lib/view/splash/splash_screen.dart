import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:wether_app/res/images/image_assets.dart';
import 'package:wether_app/view_model/services/auth_service/auth_service.dart';
// import 'package:wether_app/view/home/home_screen.dart';
// import 'package:wether_app/view_model/services/splash_services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2),(){
      AuthService.isLogedIn('/Splash');
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(ImageAssets.nightStarRain,height: 200,width: 200,),
      ),
    );
  }
}
