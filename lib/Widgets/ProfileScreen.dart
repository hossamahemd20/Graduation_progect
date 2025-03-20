import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Profile"),
        backgroundColor: Color(0xFF7E7BB9),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage("assets/uu.jpg"),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Ismail Ahmed Aboelhamd",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Grade 99 - Computer Science Department",
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            _buildInfoCard("📧 Email", "ismailaboelhamd8@gmail.com"),
            _buildInfoCard("📞 Contact", "01129861325"),

            SizedBox(height: 20),

            Text(
              "Academic Details",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            _buildAcademicDetail("Attendance", "100%"),
            _buildAcademicDetail("Total Grades", "A+"),
            _buildAcademicDetail("Behavior Score", "Excellent"),
            _buildAcademicDetail("Activities", "Coding Club, AI Research "),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String value) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(Icons.info, color: Colors.blue),
        title: Text(title),
        subtitle: Text(value),
      ),
    );
  }


  Widget _buildAcademicDetail(String title, String value) {
    return Card(
      color: Color(0xFFEFEFFB),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        trailing: Text(value, style: TextStyle(fontSize: 16, color: Colors.black87)),
      ),
    );
  }
}
