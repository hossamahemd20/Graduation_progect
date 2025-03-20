import 'package:flutter/material.dart';

class VideoLectureScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video Lectures"),
        backgroundColor: Color(0xFF7E7BB9),
      ),
      body: Center(
        child: Text(
          "This is the Video Lecture Screen",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
