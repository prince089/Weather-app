import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wether_app/view/home/components/info_card.dart';

class CustomDilog extends StatefulWidget {
  const CustomDilog({super.key});

  @override
  State<CustomDilog> createState() => _CustomDilogState();
}

class _CustomDilogState extends State<CustomDilog> {
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height/2,
      // width: 392,
      child: Dialog(
        // clipBehavior: Clip.,
        insetPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            name.text.isEmpty
                ? Padding(
                    padding: EdgeInsets.only(top: 20,left: 20,right: 20),
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
                              () {},
                            );
                          },
                          child: Text("submit"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(
                                  () {},
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
                            setState(() {});
                          },
                          child: Text("Remove Name"),
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
