import 'dart:async';

import 'package:get/get.dart';
import 'package:wether_app/view/home/home_screen.dart';
import 'package:wether_app/view_model/controllers/days_controller.dart';
import 'package:wether_app/view_model/controllers/home_controller.dart';

class SplashServices{
  static void getApiData(){
    final controller=Get.put(HomeController());
    controller.getData();

  }

  static void getApiData2(){
    final controller=Get.put(DaysController());
    controller.getData();
  }
}