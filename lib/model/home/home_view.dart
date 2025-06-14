import 'package:flutter/material.dart';
import 'package:graduation_project/Widgets/ProfileScreen.dart';
import 'package:graduation_project/Widgets/icons_bottom/Events.dart';
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
                  backgroundImage: AssetImage('assets/images/logo2.png'),
                  radius: 16,
                  backgroundColor: Colors.white,
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

class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeIn;
  late Animation<Offset> _slideIn;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    _fadeIn = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    _slideIn = Tween<Offset>(begin: Offset(0, 0.2), end: Offset.zero).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FadeTransition(
        opacity: _fadeIn,
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
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                            text: "Study ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(
                                            text: "Is Future....",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w300)),
                                      ],
                                    ),
                                    style: TextStyle(
                                      fontSize: 26,
                                      color: Colors.white,
                                      shadows: [
                                        Shadow(
                                            blurRadius: 4,
                                            color: Colors.black26,
                                            offset: Offset(2, 2))
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    "Start Study For Knowledge Not For Time Pass",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xFFF8F8F8),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 20),
                            Hero(
                              tag: 's2-image',
                              child: Image.asset(
                                'assets/images/s2.png',
                                height:
                                MediaQuery.of(context).size.height * 0.22,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Transform.translate(
                          offset: Offset(0, -50),
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.school, color: Colors.white),
                            label: const Text("Start Learning",
                                style: TextStyle(color: Colors.white)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF6A5ACD),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16), // قللناها من 25 إلى 16
              child: Column(
                children: [
                  SlideTransition(
                    position: _slideIn,
                    child: const Text(
                      "What Do You Want To Do Today?",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30), // زودنا المسافة هنا
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    childAspectRatio: 1.5,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 30,
                    children: [
                      _buildOption(context, "Video Lecture",
                          Icons.ondemand_video, VideoLectureView(videoUrl: ' ')),
                      _buildOption(context, "Materials", Icons.subject, ms()),
                      _buildOption(context, "Grades", Icons.grade, Grades()),
                      _buildOption(context, "Events", Icons.event, Events()),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(
      BuildContext context, String title, IconData icon, Widget targetScreen) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => targetScreen)),
      child: ScaleTransition(
        scale: _fadeIn,
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
                child: Icon(icon, size: 28, color: Colors.white),
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
      ),
    );
  }
}

class AppBarBottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 20);
    path.quadraticBezierTo(
        size.width / 3, size.height + 20, size.width, size.height - 20);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
