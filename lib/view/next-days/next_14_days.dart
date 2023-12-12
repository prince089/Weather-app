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
  // print(size);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              // expandedHeight: size.height/1.5,
              expandedHeight: size.height > 800 ?size.height / 1.9: size.height/1.5,
              floating: false,
              // pinned: true,
              flexibleSpace: Container(
                height:  size.height > 800 ?size.height / 1.9: size.height/1.5,
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
                        child: Expanded(
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

                            ],
                          ),
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
        ),
      ),
    );
  }
}
