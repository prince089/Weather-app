import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wether_app/view/home/components/app_bar.dart';
import 'package:wether_app/view/home/components/container_list.dart';
import 'package:wether_app/view/home/components/hours_list.dart';
import 'package:wether_app/view/home/components/info_card.dart';
import 'package:wether_app/view/home/components/location.dart';
import 'package:wether_app/view_model/controllers/Auth_controller.dart';
import 'package:wether_app/view_model/controllers/home_controller.dart';
import 'package:wether_app/view_model/services/auth_service/auth_service.dart';
import 'package:wether_app/view_model/services/splash_services/splash_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AuthController authController = Get.put(AuthController());
  // bool isLoginCheckComplete = false;
  @override
  void initState() {
    super.initState();
    loginCheck();

  }

  void loginCheck() async{
    if(AuthController.isLogedInCheked.value){
    }else{
      await AuthService.isLogedIn('/HomeScreen');
      // isLoginCheckComplete = true;
    }
    SplashServices.getApiData();
  }




  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => controller.dataLoaded.value
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                         CustomAppBar(),
                        const SizedBox(
                          height: 20,
                        ),
                        Location(),
                        Hero(
                          tag: 'TAG',
                          child: Material(
                            color: Colors.transparent,
                            child: InfoCard(),
                          ),
                        ),
                        ContainerList(),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            // Get.log('route: ${Get.routing.route}');
                            // Get.log('route tree : ${Get.routeTree}');
                            // Get.log('prevoious : ${Get.routing.previous}');
                            Get.toNamed('/Next14Day');
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                Text(
                                  'Today',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                                Spacer(),
                                Text(
                                  'Next 14 Days >',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                )
                              ],
                            ),
                          ),
                        ),
                        HoursList(),
                      ],
                    ),
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }



  // void checkLoginforscreen() {}
}
