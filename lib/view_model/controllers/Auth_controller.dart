import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthController extends GetxController {
  static RxBool isLogedInCheked = false.obs;
  // late SharedPreferences _preferences;
  GoogleSignInAccount get user => _currentUSer!;
  late final GoogleSignInAccount? _currentUSer ;




  Future<bool> checkLogin () async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool check = await preferences.getBool("isLogedIn") ?? false;
    isLogedInCheked.value = true;
    return check;
  }


  Future login ()async{

    try{
      final GoogleSignInAccount? _chossenUser = await GoogleSignIn().signIn();
      _currentUSer = _chossenUser;
      final GoogleSignInAuthentication currentUserAuth =await  _currentUSer!.authentication;
      final credintal = GoogleAuthProvider.credential(
        accessToken: currentUserAuth.accessToken,
        idToken: currentUserAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credintal);
    }on SocketException {
      print("Check your internet");
      return false;
    }catch(e){
      Get.offAllNamed('/404');
    }
  }

  Future logout()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLogedIn', false);

  }



}