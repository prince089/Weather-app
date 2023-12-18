import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotFoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Not Found'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 100,
              color: Colors.red,
            ),
            const SizedBox(height: 20),
            const Text(
              'Oops! Page not found.',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Navigate to the home page or any other page as needed
               Get.offAllNamed('/Login');
              },
              child: const Text('Go to Home'),
            ),
          ],
        ),
      ),
    );
  }
}