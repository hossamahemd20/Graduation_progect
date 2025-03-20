import 'package:flutter/material.dart';
import '../../Widgets/bottom_navigation_bar.dart';
import '../../Widgets/custom_slider.dart';
import '../login view/AboutUsScreen.dart';
import '../login view/FeesScreen.dart';
import 'ContactUsScreen.dart';
import 'GalleryScreen.dart';
import 'Notes.dart';
import 'PYQS.dart';
import 'Solving_problems.dart';
import 'StudyMaterialScreen.dart';
import 'Video_lecture.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    _HomePageContent(),
    AboutUsScreen(),
    FeesScreen(),
    StudyMaterialScreen(),
    GalleryScreen(),
    ContactUsScreen(),
  ];

  void _onItemTapped(int index) {
    debugPrint("Navigating to index: $index");
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomSidebar(),
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: CustomBottomNav(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class _HomePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF7E7BB9), Color(0xFFB0A8D2)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/images/sgs logo.png'),
                          radius: 20,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Student Information System",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Builder(
                      builder: (context) => IconButton(
                        icon: const Icon(Icons.menu, color: Colors.white, size: 40),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                const Text(
                  "Study Is Future....",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  "Start Study For Knowledge Not For Time Pass",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  child: const Text("Start Learning"),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                const Text(
                  "What Do You Want To Do Today?",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  childAspectRatio: 1, // ضبط النسبة بين العرض والارتفاع
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: [
                    _buildOption(context, "Video Lecture", Icons.ondemand_video, VideoLectureScreen()),
                    _buildOption(context, "Notes", Icons.note, NotesScreen()),
                    _buildOption(context, "PYQS", Icons.question_answer, PYQSScreen()),
                    _buildOption(context, "Solving Problems", Icons.assignment, SolvingProblemsScreen()),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOption(BuildContext context, String title, IconData icon, Widget targetScreen) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => targetScreen),
        );
      },
      child: Card(
        color: Color(0xFFB0A8D2), // لون مناسب
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5, // تأثير ظل جميل
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 60, color: Colors.white), // تصغير الأيقونة قليلاً
              SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
