import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wether_app/view/next-days/components/app_bar.dart';
import 'package:wether_app/view/next-days/components/bottom_list.dart';
import 'package:wether_app/view/next-days/components/days_list.dart';
import 'package:wether_app/view_model/controllers/days_controller.dart';
import 'package:wether_app/view_model/controllers/home_controller.dart';
import 'components/center_card.dart';

class NextDays extends StatelessWidget {
  final homeController = Get.put(HomeController());
  final controller = Get.put(DaysController());

  NextDays({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
            height: size.height,
            width: size.width,
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  expandedHeight: 220,
                  // floating: false,
                  // pinned: true,
                  flexibleSpace: Container(
                    height: size.height / 1.8,
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
                        ],
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
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
                                  child: CenterCard()),
                            ),
                            BottomList(),
                          ],
                        ),
                      )
                      //DaysList(),
                    ],
                  ),
                ),
              ],
            )

            /*Stack(
            // alignment: Alignment.center,
            children: [
              Positioned(
                top: 1,
                child: Container(
                  height: size.height / 1.8,
                  width: size.width,
                  decoration: const BoxDecoration(
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
                    ],
                  ),
                ),
              ),
              BottomList(),
              Positioned(
                top: 220,
                left: 10,
                child: Hero(
                  tag: 'TAG',
                  child: Material(color: Colors.transparent, child: CenterCard()),
                ),
              )
            ],
          ),*/
            ),
      ),
    );
  }
}
