import 'package:flutter/material.dart';
import 'package:graduation_project/model/home/home_view.dart';

void main() {
  runApp(const Events());
}

class Events extends StatelessWidget {
  const Events({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'School Events',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Cairo'),
      home: const EventsHomePage(),
    );
  }
}

class EventsHomePage extends StatelessWidget {
  const EventsHomePage({super.key});

  final Color mainColor = const Color(0xFF8180B6);

  final List<Map<String, String>> events = const [
    {
      "title": "المؤتمر التكنولوجي",
      "date": "5 يونيو 2025",
      "time": "9:00 صباحًا",
      "location": "مسرح المدرسة",
      "limit": "150 طالب",
    },
    {
      "title": "اليوم المفتوح",
      "date": "12 يونيو 2025",
      "time": "10:00 صباحًا",
      "location": "الملعب الرئيسي",
      "limit": "كل الطلاب",
    },
    {
      "title": "رحلة المتحف",
      "date": "18 يونيو 2025",
      "time": "8:00 صباحًا",
      "location": "متحف الحضارة",
      "limit": "60 طالب",
    },
    {
      "title": "حفل التفوق",
      "date": "25 يونيو 2025",
      "time": "11:00 صباحًا",
      "location": "قاعة كبار الزوار",
      "limit": "المتفوقين + أولياء الأمور",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: mainColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
        title: const Text(
          "الفعاليات المدرسية",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
          textAlign: TextAlign.right,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(height: 12),
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [mainColor.withOpacity(0.85), mainColor.withOpacity(0.5)],
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.bottomRight,
                      child: const Text(
                        "الحدث الرئيسي: حفل التفوق الدراسي",
                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      "الأحداث القادمة",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 16),
                    ...events.map((event) => AnimatedEventCard(event: event, mainColor: mainColor)).toList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedEventCard extends StatefulWidget {
  final Map<String, String> event;
  final Color mainColor;

  const AnimatedEventCard({super.key, required this.event, required this.mainColor});

  @override
  State<AnimatedEventCard> createState() => _AnimatedEventCardState();
}

class _AnimatedEventCardState extends State<AnimatedEventCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 700));
    _slideAnimation = Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _fadeAnimation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: EventCard(event: widget.event, mainColor: widget.mainColor),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final Map<String, String> event;
  final Color mainColor;

  const EventCard({super.key, required this.event, required this.mainColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(width: 6, color: mainColor),
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            offset: const Offset(0, 4),
            blurRadius: 6,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.event, color: Colors.deepPurple),
                Text(
                  event["title"]!,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text("التاريخ: ${event['date']}", style: const TextStyle(fontSize: 15)),
            Text("الوقت: ${event['time']}", style: const TextStyle(fontSize: 15)),
            Text("المكان: ${event['location']}", style: const TextStyle(fontSize: 15)),
            Text("عدد الحضور: ${event['limit']}", style: const TextStyle(fontSize: 15)),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.info_outline),
                label: const Text("عرض التفاصيل"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: mainColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
