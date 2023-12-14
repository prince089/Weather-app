import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wether_app/view/next-days/components/app_bar.dart';
import 'package:wether_app/view/next-days/components/bottom_list.dart';
import 'package:wether_app/view/next-days/components/days_list.dart';
import 'package:wether_app/view_model/controllers/days_controller.dart';
import 'package:wether_app/view_model/services/splash_services/splash_services.dart';
import 'components/center_card.dart';

class NextDays extends StatefulWidget {
  NextDays({super.key});

  @override
  State<NextDays> createState() => _NextDaysState();
}

class _NextDaysState extends State<NextDays> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SplashServices.getApiData2();
  }

  final controller = Get.put(DaysController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    // print(size);
    Get.log('from next 14 day at init route: ${Get.routing.route}');
    Get.log('from next 14 day at init  route tree : ${Get.routeTree}');
    Get.log('from next 14 day at init  prevoious : ${Get.routing.previous}');
    if(Get.routing.previous.isEmpty){
      Get.log("empty");
    }
    else{
      Get.log("not empty");
    }
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => controller.dataLoaded.value
              ? CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      // expandedHeight: size.height/1.5,
                      expandedHeight: size.height > 800
                          ? size.height / 1.9
                          : size.height / 1.5,
                      floating: false,
                      // pinned: true,
                      flexibleSpace: Container(
                        height: size.height > 800
                            ? size.height / 1.9
                            : size.height / 1.5,
                        width: size.width,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xff6ac5fe),
                              Color(0xff45b6fe),
                              Color(0xff45b6fe),
                              // Colors.blue
                            ],
                          ),
                        ),
                        child: SingleChildScrollView(
                          physics: NeverScrollableScrollPhysics(),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              const CustomAppBar(),
                              const SizedBox(
                                height: 20,
                              ),
                              DaysList(),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  // color: Colors.blue,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15.0),
                                    bottomRight: Radius.circular(15.0),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Hero(
                                      tag: 'TAG',
                                      child: Material(
                                        color: Colors.transparent,
                                        child: CenterCard(),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          BottomList(),
                          //DaysList(),
                        ],
                      ),
                    ),
                  ],
                )
              : Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
