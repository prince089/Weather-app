import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wether_app/view_model/controllers/Auth_controller.dart';
import 'package:wether_app/view_model/controllers/home_controller.dart';
import 'package:wether_app/view_model/services/auth_service/auth_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // AuthController authcontroller = Get.put(AuthController());
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2),(){
      AuthService.isLogedIn('/Login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: ElevatedButton(
          onPressed: ()async{
            if( await AuthService.login()){
              Get.offAllNamed('/HomeScreen');
            }
            else{
              Get.offAllNamed('/Login');
            }
          },
          child: Text('Login'),
        ),
      ),
    );
  }
}