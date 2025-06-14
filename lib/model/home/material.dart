import 'package:flutter/material.dart';

void main() {
  runApp(const ms());
}

class ms extends StatelessWidget {
  const ms({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grades Professional',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Cairo',
        primaryColor: const Color(0xFF5A4EBD),
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF5A4EBD),
          centerTitle: true,
          elevation: 4,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
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

class _GradesProPageState extends State<GradesProPage> {
  final String studentName = "أحمد محمد";
  final String studentClass = "الصف الثالث الثانوي";
  final String studentId = "123456789";

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
      "teacher": "أستاذة نجلاء سمير",
      "finalGrade": 80,
      "attendance": 88,
      "performance": "جيد جداً",
      "notes": "تقدم ملحوظ مع ضرورة زيادة المشاركة الصفية.",
      "details": {
        "نصف الفصل": 78,
        "النهائي": 82,
        "الواجبات": 80,
      },
    },
    {
      "subject": "العلوم",
      "teacher": "أستاذ كريم حسن",
      "finalGrade": 65,
      "attendance": 90,
      "performance": "متوسط",
      "notes": "يحتاج لتحسين الفهم النظري والتمارين العملية.",
      "details": {
        "نصف الفصل": 60,
        "النهائي": 68,
        "الواجبات": 65,
      },
    },
    {
      "subject": "اللغة الإنجليزية",
      "teacher": "أستاذة منى سعيد",
      "finalGrade": 75,
      "attendance": 85,
      "performance": "جيد",
      "notes": "يحسن مهارات المحادثة، لكن يحتاج مراجعة القواعد.",
      "details": {
        "نصف الفصل": 70,
        "النهائي": 78,
        "الواجبات": 75,
      },
    },
    {
      "subject": "التاريخ",
      "teacher": "أستاذ سامي إبراهيم",
      "finalGrade": 55,
      "attendance": 70,
      "performance": "ضعيف",
      "notes": "غيابات كثيرة وأداء ضعيف في الاختبارات.",
      "details": {
        "نصف الفصل": 50,
        "النهائي": 58,
        "الواجبات": 55,
      },
    },
  ];

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
      appBar: AppBar(title: const Text("الدرجات")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Student Info
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    studentName,
                    style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "الصف: $studentClass",
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  Text(
                    "الرقم التعريفي: $studentId",
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 12),
                  // Average Grade Bar
                  Text(
                    "المعدل الكلي",
                    style: TextStyle(fontSize: 18, color: Colors.grey[800], fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 6),
                  Stack(
                    children: [
                      Container(
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      Container(
                        height: 20,
                        width: MediaQuery.of(context).size.width * (avg / 100),
                        decoration: BoxDecoration(
                          color: gradeColor(avg.toInt()),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "${avg.toStringAsFixed(2)}%",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: gradeColor(avg.toInt()),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Grades List Header + Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "تفاصيل المواد",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        // TODO: Implement refresh logic
                      },
                      icon: const Icon(Icons.refresh),
                      label: const Text("تحديث البيانات"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF5A4EBD),
                      ),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton.icon(
                      onPressed: () {
                        // TODO: Implement export PDF
                      },
                      icon: const Icon(Icons.picture_as_pdf),
                      label: const Text("تحميل تقرير PDF"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent.shade700,
                      ),
                    ),
                  ],
                )
              ],
            ),

            const SizedBox(height: 14),

            // List of Grades with expandable details
            ...grades.map((g) {
              return GradeCard(data: g, gradeColor: gradeColor, performanceIcon: performanceIcon);
            }).toList(),
          ],
        ),
      ),
    );
  }
}

class GradeCard extends StatefulWidget {
  final Map<String, dynamic> data;
  final Color Function(int) gradeColor;
  final Icon Function(String) performanceIcon;

  const GradeCard({
    super.key,
    required this.data,
    required this.gradeColor,
    required this.performanceIcon,
  });

  @override
  State<GradeCard> createState() => _GradeCardState();
}

class _GradeCardState extends State<GradeCard> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    final data = widget.data;
    final int finalGrade = data['finalGrade'];
    final String performance = data['performance'];

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Header row: Subject, Teacher, Grade, Icon, Expand Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Subject + Teacher
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        data['subject'],
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "الأستاذ: ${data['teacher']}",
                        style: TextStyle(color: Colors.grey[700], fontSize: 14),
                      ),
                    ],
                  ),
                ),

                // Grade with color & performance icon
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      decoration: BoxDecoration(
                        color: widget.gradeColor(finalGrade).withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "$finalGrade%",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: widget.gradeColor(finalGrade),
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    widget.performanceIcon(performance),
                  ],
                ),

                const SizedBox(width: 12),

                // Expand / Collapse Button
                IconButton(
                  icon: Icon(expanded ? Icons.expand_less : Icons.expand_more),
                  onPressed: () {
                    setState(() {
                      expanded = !expanded;
                    });
                  },
                ),
              ],
            ),

            if (expanded) ...[
              const Divider(height: 20, thickness: 1.2),
              // Attendance
              Text("الحضور: ${data['attendance']}%", style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 10),

              // Performance text
              Text(
                "مستوى الأداء: ${performance}",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: widget.gradeColor(finalGrade),
                ),
              ),
              const SizedBox(height: 10),

              // Details of exam and assignments
              Text("تفاصيل الدرجات:", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),

              ...data['details'].entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(entry.key, style: const TextStyle(fontSize: 15, color: Colors.black87)),
                      Text("${entry.value}%", style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                    ],
                  ),
                );
              }).toList(),

              const SizedBox(height: 10),

              // Notes
              Text("ملاحظات المدرس:", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              Text(data['notes'], style: const TextStyle(fontSize: 14, color: Colors.black87)),
            ],
          ],
        ),
      ),
    );
  }
}
