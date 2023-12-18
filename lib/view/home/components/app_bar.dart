import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wether_app/view_model/controllers/home_controller.dart';
import 'package:wether_app/view_model/services/auth_service/auth_service.dart';
import '../../../res/images/image_assets.dart';

class CustomAppBar extends StatelessWidget {
  HomeController homeController = Get.put(HomeController());

  CustomAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: GestureDetector(
            onTap: (){
              AuthService.logout();
            },
            child: const Icon(
              Icons.logout_sharp,
              color: Colors.grey,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        // const Spacer(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(
            () => homeController.nameFromBottom.value == ""
                ? const Text("Nothing")
                : Text("${homeController.nameFromBottom.value}"),
          ),
        )
      ],
    );
  }
}
