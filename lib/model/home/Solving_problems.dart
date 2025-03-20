import 'package:flutter/material.dart';

class SolvingProblemsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Solving Problems"),
        backgroundColor: Color(0xFF7E7BB9),
      ),
      body: Center(
        child: Text(
          "This is the Solving Problems Screen",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
