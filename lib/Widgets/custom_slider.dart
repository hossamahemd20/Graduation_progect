import 'package:flutter/material.dart';

import '../model/home/ContactUsScreen.dart';
import '../model/home/GalleryScreen.dart';
import '../model/home/StudyMaterialScreen.dart';
import '../model/home/home_view.dart';
import '../model/login view/AboutUsScreen.dart';
import '../model/login view/FeesScreen.dart';
import '../model/login view/login view.dart';

class CustomSidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          // الخلفية الرئيسية
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Color(0xFF7E7BB9),
          ),
          // القائمة الجانبية المنحنية
          Container(
            width: MediaQuery.of(context).size.width * 1.5,
            decoration: BoxDecoration(
              color: Color(0xFF7E7BB9),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(250), // زيادة التدوير
                bottomRight: Radius.circular(250), // زيادة التدوير
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 80),
                _buildMenuItem(context, "HOME", () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                }),
                _buildMenuItem(context, "ABOUT US", () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUsScreen()));
                }),
                _buildMenuItem(context, "FEES", () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FeesScreen()));
                }),
                // _buildMenuItem(context, "STUDY MATERIAL", () {
                //   Navigator.push(context, MaterialPageRoute(builder: (context) => StudyMaterialScreen()));
                // }),
                _buildMenuItem(context, "GALLERY", () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => GalleryScreen()));
                }),
                _buildMenuItem(context, "CONTACT US", () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUsScreen()));
                }),
                Spacer(),
                _buildMenuItem(context, "LOGIN ", () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginView()));
                }),
                SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, VoidCallback onTap) {
    return InkWell(
      onTap: () {
        Navigator.pop(context); // إغلاق القائمة الجانبية
        onTap(); // تنفيذ التنقل
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
