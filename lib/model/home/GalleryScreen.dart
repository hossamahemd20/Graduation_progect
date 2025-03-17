import 'package:flutter/material.dart';
// استيراد صفحة AboutUsScreen

class GalleryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GalleryScreen()),
            );
          },
          child: Text("Go to About Us"),
        ),
      ),
    );
  }
}
