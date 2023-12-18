import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wether_app/view_model/controllers/Auth_controller.dart';

class AuthService {

  static Future isLogedIn(String path) async {
    AuthController authController = Get.put(AuthController());
      if(await authController.checkLogin()){
        //login che
        // print("login");
        if(path == "/Login"){
          print("path = ${path}");
          Get.offAllNamed("/HomeScreen");

        }
        else{
          Get.offAllNamed(path);
        }

      }
      else{
        print("not loged in");
        Get.offAllNamed("/Login");
      }

    // if ) {
    //   //login hoy to
    //   if (path == '/Splash') {
    //     // Get.offAllNamed("/ ");
    //     print("path is splash and login");
    //     Get.offAllNamed("/HomeScreen");
    //   }
    //   else if (path == '/HomeScreen') {
    //
    //
    //     if (!Get.routing.previous.isEmpty) {
    //
    //     } else {
    //       //not fresh request
    //       if(path != "/Homescreen"){
    //         //nothing to do
    //       }else{
    //         Get.offAllNamed("/path"); // move to specific screen
    //       }
    //     }
    //     print("path is home and previous ${Get.routing.previous.isEmpty}");
    //   }
    //   // else if(path == '/')
    // }
    // else {
    //   if (path == "/Login") {
    //     if (path == "/Login") {
    //     } else {}
    //   }
    // }
    //

  }

  static Future<bool> login() async {
    AuthController authController = Get.put(AuthController());
    try{
      // bool loginStatus = await authController.login();
    }on SocketException{
        print("Please Check your Internet");
        return false;
    }
    catch(e){
      print("Something Went wrong");
      return false;
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLogedIn', true);
    return true;
  }


  static void logout()async{
    AuthController authController = Get.put(AuthController());
    await authController.logout();
    Get.offAllNamed('/Login');
  }
}
