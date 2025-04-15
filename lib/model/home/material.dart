import 'package:flutter/material.dart';

class material extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Material"),
        backgroundColor: Color(0xFF7E7BB9),
      ),
      body: Center(
        child: Text(
          "This is the Material Screen",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
