import 'package:flutter/material.dart';

class Grades extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grades"),
        backgroundColor: Color(0xFF7E7BB9),
      ),
      body: Center(
        child: Text(
          "This is the Grades Screen",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
