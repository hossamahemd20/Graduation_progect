import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Us"),
        backgroundColor: Color(0xFF7E7BB9),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Image.asset("assets/kotoube.jpg", height: 100),
                  SizedBox(height: 10),
                  Text(
                    "School Management System",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Empowering Schools with Smart Technology",
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            Text(
              "Who We Are",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              "We are a passionate team dedicated to transforming the educational system by providing an advanced School Management System. Our platform connects students, parents, teachers, and administrators to create an efficient and transparent educational ecosystem.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),

            Text(
              "Our Mission",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              "To revolutionize school management by integrating smart digital solutions that enhance communication, performance tracking, and administrative efficiency.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),

            Text(
              "Key Features",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            ListTile(
              leading: Icon(Icons.school, color: Colors.blue),
              title: Text("Student Progress Tracking"),
              subtitle: Text("Monitor student performance with detailed analytics."),
            ),
            ListTile(
              leading: Icon(Icons.people, color: Colors.green),
              title: Text("Parent Involvement"),
              subtitle: Text("Keep parents updated on their child's progress."),
            ),
            ListTile(
              leading: Icon(Icons.assignment, color: Colors.orange),
              title: Text("Teacher & Admin Dashboard"),
              subtitle: Text("Simplify lesson planning and administrative tasks."),
            ),
            ListTile(
              leading: Icon(Icons.notifications, color: Colors.red),
              title: Text("Instant Notifications"),
              subtitle: Text("Receive real-time updates on important school events."),
            ),



            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text("Back to Home", style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
