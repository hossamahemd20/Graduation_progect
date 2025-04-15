import 'package:flutter/material.dart';
import 'package:graduation_project/Widgets/ProfileScreen.dart';
import 'package:graduation_project/Widgets/icons_bottom/Books.dart';
import 'package:graduation_project/Widgets/icons_bottom/QuizScreen.dart';
import 'package:graduation_project/model/home/Grades.dart';
import 'package:graduation_project/model/home/material.dart';
import '../../Widgets/custom_slider.dart';
import '../../Widgets/icons_bottom/custom_nav_bar.dart';
import 'SolvingProblemsScreen.dart';
import 'Video_lecture.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeContent(),
    Quizscreen(),
    TimeTable(),
    ProfileScreen(),
  ];

  _onItemTapped(int index) {
    if (index == _selectedIndex) return;
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomSidebar(),
      drawerEnableOpenDragGesture: false,
      appBar: AppBar(
        backgroundColor: Color(0xFF7E7BB9),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
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
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: CustomBottomNav(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: AppBarBottomCurveClipper(),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF7E7BB9), Color(0xFFB0A8D2)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Study Is Future....",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "Start Study For Knowledge Not For Time Pass",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 20),
                          Image.asset(
                            'assets/images/s2.png',
                            height: 120,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF6A5ACD),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text("Start Learning", style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
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
                  crossAxisCount: 2, // 2 أعمدة بدلاً من 4
                  childAspectRatio: 1.5,
                  mainAxisSpacing: 20, // زيادة المسافة بين العناصر
                  crossAxisSpacing: 20, // زيادة المسافة بين الأعمدة
                  children: [
                    _buildOption(context, "Video Lecture", Icons.ondemand_video, VideoLectureView(videoUrl: ' ')),
                    _buildOption(context, "Materials", Icons.subject, material()),
                    _buildOption(context, "Grades", Icons.grade, Grades()),
                    _buildOption(context, "Events", Icons.event, Events()), // تأكد من أن Quizscreen موجودة لديك
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
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => targetScreen)),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color(0xFF8180B6),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 24, color: Colors.white), // أصغر حجم للأيقونة
            ),
            SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AppBarBottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 0); // بداية من أعلى اليسار
    path.lineTo(0, size.height - 20); // نزول بسيط في اليسار
    // إضافة زاوية مائلة في الأسفل بدلاً من الانحناء العادي
    path.quadraticBezierTo(size.width / 3, size.height + 20, size.width, size.height - 20); // زاوية مائلة
    path.lineTo(size.width, 0); // خط من أعلى اليمين
    path.close(); // إغلاق المسار
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
