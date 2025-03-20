import 'package:flutter/material.dart';

class NotesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
        backgroundColor: Color(0xFF7E7BB9),
      ),
      body: Center(
        child: Text(
          "This is the Notes Screen",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
