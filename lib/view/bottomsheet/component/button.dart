import 'package:flutter/material.dart';

class ButtonBottomSheet extends StatelessWidget {
  final int noOfButton;
  const ButtonBottomSheet({super.key, required int this.noOfButton});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("total number of button ${noOfButton}"),
    );
  }
}
