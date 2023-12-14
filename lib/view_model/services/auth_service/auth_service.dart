import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:wether_app/view_model/controllers/Auth_controller.dart';

class AuthService {
  static void isLogedIn(String path) async {
    AuthController authController = Get.put(AuthController());
    await authController.checkLogin();


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
    AuthController authcontroller = Get.put(AuthController());
    await authcontroller.login();
    return true;
  }
}
