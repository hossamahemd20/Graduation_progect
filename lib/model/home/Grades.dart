import 'package:flutter/material.dart';
import 'dart:math';
import 'home_view.dart';

void main() {
  runApp(const Grades());
}

class Grades extends StatelessWidget {
  const Grades({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grades Professional',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Cairo',
        primaryColor: const Color(0xFF8180B6),
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF8180B6),
          centerTitle: true,
          elevation: 4,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      home: const GradesProPage(),
    );
  }
}

class GradesProPage extends StatefulWidget {
  const GradesProPage({super.key});

  @override
  State<GradesProPage> createState() => _GradesProPageState();
}

class _GradesProPageState extends State<GradesProPage>
    with SingleTickerProviderStateMixin {
  final String studentName = "أحمد محمد";
  final String studentClass = "الصف الثالث الثانوي";
  final String studentId = "123456789";

  late AnimationController _controller;
  late Animation<double> _animation;

  final List<Map<String, dynamic>> grades = [
    {
      "subject": "الرياضيات",
      "teacher": "أستاذ محمود علي",
      "finalGrade": 95,
      "attendance": 92,
      "performance": "ممتاز",
      "notes": "أداء ممتاز في الامتحانات، حافظ على استمرارية الحضور.",
      "details": {
        "نصف الفصل": 96,
        "النهائي": 94,
        "الواجبات": 95,
      },
    },
    {
      "subject": "اللغة العربية",
      "teacher": "أستاذة منى حسن",
      "finalGrade": 88,
      "attendance": 90,
      "performance": "جيد جداً",
      "notes": "يحتاج إلى تحسين الخط والإملاء.",
      "details": {
        "نصف الفصل": 85,
        "النهائي": 90,
        "الواجبات": 87,
      },
    },
    {
      "subject": "الكيمياء",
      "teacher": "أستاذ يوسف صابر",
      "finalGrade": 73,
      "attendance": 85,
      "performance": "جيد",
      "notes": "يجب مراجعة المعادلات الكيميائية باستمرار.",
      "details": {
        "نصف الفصل": 70,
        "النهائي": 75,
        "الواجبات": 74,
      },
    },
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double calculateAverage() {
    if (grades.isEmpty) return 0;
    double total = 0;
    for (var g in grades) {
      total += g['finalGrade'] as int;
    }
    return total / grades.length;
  }

  Color gradeColor(int grade) {
    if (grade >= 90) return Colors.green.shade700;
    if (grade >= 80) return Colors.lightGreen.shade700;
    if (grade >= 70) return Colors.orange.shade700;
    if (grade >= 60) return Colors.deepOrange.shade400;
    return Colors.red.shade700;
  }

  Icon performanceIcon(String performance) {
    switch (performance) {
      case "ممتاز":
        return const Icon(Icons.emoji_events, color: Colors.amber, size: 26);
      case "جيد جداً":
        return const Icon(Icons.thumb_up_alt, color: Colors.lightGreen, size: 24);
      case "جيد":
        return const Icon(Icons.check_circle_outline, color: Colors.blue, size: 24);
      case "متوسط":
        return const Icon(Icons.hourglass_bottom, color: Colors.orange, size: 24);
      case "ضعيف":
      default:
        return const Icon(Icons.warning_amber_rounded, color: Colors.red, size: 26);
    }
  }

  @override
  Widget build(BuildContext context) {
    double avg = calculateAverage();

    return Scaffold(
      appBar: AppBar(
        title: const Text("الدرجات"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
      ),
      body: FadeTransition(
        opacity: _animation,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF8180B6), Color(0xFFAFAEEA)],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 2,
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("اسم الطالب: $studentName",
                          style: const TextStyle(color: Colors.white, fontSize: 17)),
                      Text("الصف: $studentClass",
                          style: const TextStyle(color: Colors.white, fontSize: 17)),
                      Text("رقم الهوية: $studentId",
                          style: const TextStyle(color: Colors.white, fontSize: 17)),
                      const SizedBox(height: 10),
                      Text(
                        "المعدل العام: ${avg.toStringAsFixed(1)}%",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ...grades.asMap().entries.map((entry) {
                int index = entry.key;
                var grade = entry.value;
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(1, 0),
                    end: Offset.zero,
                  ).animate(CurvedAnimation(
                    parent: _controller,
                    curve: Interval(0.2 * index, 1, curve: Curves.easeOut),
                  )),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                      border: Border(
                        right:
                        BorderSide(width: 6, color: gradeColor(grade['finalGrade'])),
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
                              performanceIcon(grade["performance"]),
                              Text(
                                grade["subject"],
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text("المعلم: ${grade['teacher']}",
                              style: TextStyle(fontSize: 15)),
                          Text("الحضور: ${grade['attendance']}%"),
                          Text("التقدير: ${grade['performance']}"),
                          const SizedBox(height: 4),
                          Text("ملاحظات: ${grade['notes']}",
                              textAlign: TextAlign.right),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "الدرجة النهائية: ${grade['finalGrade']}%",
                                style: TextStyle(
                                  color: gradeColor(grade['finalGrade']),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const Icon(Icons.school, color: Colors.deepPurple),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ExpansionTile(
                              title: const Text("تفاصيل الدرجات",
                                  textAlign: TextAlign.right),
                              children:
                              (grade['details'] as Map<String, dynamic>)
                                  .entries
                                  .map((e) {
                                return ListTile(
                                  title: Text("${e.key}"),
                                  trailing: Text("${e.value}"),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
