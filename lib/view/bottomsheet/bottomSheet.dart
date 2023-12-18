import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wether_app/view_model/controllers/home_controller.dart';

class CustomBottomSheet extends StatefulWidget {
  final Widget componentName;
  const CustomBottomSheet({
    super.key,
    required Widget this.componentName,
  });

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  HomeController homeController = Get.put(HomeController());
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // var componentName;
    return SizedBox(
      height: MediaQuery.of(context).size.height/2,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.cancel),
          ),
          widget.componentName,
        ],
      ),
    );
    /*GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Container(
        height: MediaQuery.of(context).size.height / 2,
        child: Column(
          children: [
            name.text.isEmpty
                ? Padding(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: name,
                          decoration: const InputDecoration(
                            hintText: 'Enter your name',
                            labelText: 'name',
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(
                              () {

                                homeController.namefrombottom.value = name.text.toString();
                              },
                            );
                          },
                          child: Text("submit"),
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Center(
                          child: Text("your Text is ${name.text}"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            name.clear();
                            homeController.namefrombottom.value = "";
                            setState(() {});
                          },
                          child: Text("Remove Name"),
                        ),
                      ],
                    ),
                  ),
            ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("Close"))
          ],
        ),
      ),
    );*/
  }
}
