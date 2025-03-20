import 'package:flutter/material.dart';

class PYQSScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PYQS"),
        backgroundColor: Color(0xFF7E7BB9),
      ),
      body: Center(
        child: Text(
          "This is the PYQS Screen",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
