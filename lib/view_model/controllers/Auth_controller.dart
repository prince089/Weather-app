import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthController extends GetxController {
  // RxBool isLogedIn = false.obs;
  // late SharedPreferences _preferences;



  Future<bool> checkLogin () async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool check = await preferences.getBool("isLogedIn") ?? false;
    return check;
  }


  Future login ()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLogedIn', true);

  }

  void logout()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', false);
  }



}