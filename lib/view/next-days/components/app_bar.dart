import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wether_app/res/images/image_assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Get.log('from next 14 day on press route: ${Get.routing.route}');
              Get.log('from next 14 dayon press  route tree : ${Get.routeTree}');
              Get.log('from next 14 dayon press  prevoious : ${Get.routing.previous}');
              Get.toNamed('/Next14Day');
              // Get.toNamed('/Next14Day')k();
              // Get.toNamed('/HomeScreen');
              Get.back();

            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.blue,
                size: 20,

              ),
            ),
          ),
          const Text(
            'Next 14 Days',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(),
        ],
      ),
    );
  }
}
