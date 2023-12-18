import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wether_app/view_model/controllers/home_controller.dart';

class NameBottomSheet extends StatefulWidget {
  final String name;
  NameBottomSheet({super.key, required String this.name});

  @override
  State<NameBottomSheet> createState() => _NameBottomSheetState();
}

class _NameBottomSheetState extends State<NameBottomSheet> {
  HomeController homeController = Get.put(HomeController());

  TextEditingController _tecname = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => homeController.nameFromBottom.value == ""
          ? Column(
              children: [
                TextField(
                  controller: _tecname,
                  decoration: const InputDecoration(
                    hintText: 'Enter Your Name',
                    labelText: 'Name',
                  ),
                  style: const TextStyle(fontSize: 18.0),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    homeController.nameFromBottom.value = _tecname.text;
                    // setState(() {
                    //
                    // });
                  },
                  child: const Text('Submit'),
                ),
              ],
            )
          : Column(
              children: [
                Text(
                  "Name ${homeController.nameFromBottom.value}",
                ),
                ElevatedButton(
                  onPressed: () {
                    homeController.nameFromBottom.value = "" ;
                    _tecname.clear();
                  },
                  child: const Text("Remove Name"),
                ),
              ],
            ),
    );
  }
}
