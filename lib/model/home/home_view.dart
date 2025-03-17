import 'package:flutter/material.dart';

import '../colors_palette/colors_palette.dart';
import '../login view/AboutUsScreen.dart';
import '../login view/FeesScreen.dart';
import 'ContactUsScreen.dart';
import 'GalleryScreen.dart';
import 'StudyMaterialScreen.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsPalette.primaryColor,
        elevation: 0,
        title: Row(
          children: [
            ClipOval(
                // child: Image.asset(
                //   'assets/images/school_logo.jpg',
                //   height: 20,
                //   width: 20,
                //   fit: BoxFit.cover,
                // ),
                ),
            const SizedBox(width: 10),
            const Text(
              'School Name',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: _buildDrawer(context),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: ColorsPalette.primaryColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Study Is Future....",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Start Study For Knowledge Not For Time Pass",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    // زر الاكشن
                  },
                  child: const Text(
                    "Start Learning",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                "Page ${_selectedIndex + 1} Content",
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: ColorsPalette.primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.create), label: "Quiz"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Books"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: ColorsPalette.primaryColor),
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/images/school_logo.jpg',
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  'School Name',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
          _buildListTile(context, "HOME", () {
            Navigator.pop(context);
          }, Icons.home),
          _buildListTile(context, "ABOUT US", () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AboutUsScreen()));
          }, Icons.info),
          _buildListTile(context, "FEES", () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FeesScreen()));
          }, Icons.monetization_on),
          _buildListTile(context, "STUDY MATERIAL", () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => StudyMaterialScreen()));
          }, Icons.menu_book),
          _buildListTile(context, "GALLERY", () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => GalleryScreen()));
          }, Icons.photo_album),
          _buildListTile(context, "CONTACT US", () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ContactUsScreen()));
          }, Icons.phone),
        ],
      ),
    );
  }

  Widget _buildListTile(
      BuildContext context, String title, VoidCallback onTap, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: ColorsPalette.primaryColor),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      onTap: onTap,
    );
  }
}
