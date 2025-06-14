import 'package:flutter/material.dart';

void main() {
  runApp(TimeTable());
}

class TimeTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'الجداول الدراسية',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Tajawal',
      ),
      home: GradeSelectionScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class GradeSelectionScreen extends StatelessWidget {
  final List<Map<String, dynamic>> grades = [
    {'name': 'الرابع الابتدائي', 'icon': Icons.school, 'level': 'ابتدائي'},
    {'name': 'الخامس الابتدائي', 'icon': Icons.school, 'level': 'ابتدائي'},
    {'name': 'السادس الابتدائي', 'icon': Icons.school, 'level': 'ابتدائي'},
    {'name': 'الأول الإعدادي', 'icon': Icons.school, 'level': 'إعدادي'},
    {'name': 'الثاني الإعدادي', 'icon': Icons.school, 'level': 'إعدادي'},
    {'name': 'الثالث الإعدادي', 'icon': Icons.school, 'level': 'إعدادي'},
    {'name': 'الأول الثانوي', 'icon': Icons.school, 'level': 'ثانوي'},
    {'name': 'الثاني الثانوي', 'icon': Icons.school, 'level': 'ثانوي'},
    {'name': 'الثالث الثانوي', 'icon': Icons.school, 'level': 'ثانوي'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('اختر صفك الدراسي'),
        centerTitle: true,
        automaticallyImplyLeading: false, // إخفاء زر العودة هنا
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.9,
        ),
        itemCount: grades.length,
        itemBuilder: (context, index) {
          return GradeCard(
            grade: grades[index],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ScheduleScreen(gradeName: grades[index]['name']),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class GradeCard extends StatelessWidget {
  final Map<String, dynamic> grade;
  final VoidCallback onTap;

  const GradeCard({required this.grade, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(grade['icon'], size: 40, color: Colors.blue),
            SizedBox(height: 10),
            Text(
              grade['name'],
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              grade['level'],
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class ScheduleScreen extends StatelessWidget {
  final String gradeName;

  ScheduleScreen({required this.gradeName});

  final Map<String, List<Map<String, String>>> scheduleData = {
    'الأحد': [
      {'time': '8:00 - 9:00', 'subject': 'اللغة العربية', 'teacher': 'أ. أحمد محمد', 'room': '101'},
      {'time': '9:00 - 10:00', 'subject': 'الرياضيات', 'teacher': 'د. علي محمود', 'room': '102'},
      {'time': '10:00 - 11:00', 'subject': 'العلوم', 'teacher': 'أ. خالد عبدالله', 'room': 'المعمل 1'},
      {'time': '11:00 - 11:30', 'subject': 'فسحة', 'teacher': '', 'room': ''},
      {'time': '11:30 - 12:30', 'subject': 'اللغة الإنجليزية', 'teacher': 'أ. سامي راشد', 'room': '103'},
      {'time': '12:30 - 1:30', 'subject': 'التربية الإسلامية', 'teacher': 'أ. عبدالله سالم', 'room': '104'},
    ],
    'الاثنين': [
      {'time': '8:00 - 9:00', 'subject': 'الرياضيات', 'teacher': 'د. علي محمود', 'room': '102'},
      {'time': '9:00 - 10:00', 'subject': 'اللغة العربية', 'teacher': 'أ. أحمد محمد', 'room': '101'},
      {'time': '10:00 - 11:00', 'subject': 'التاريخ', 'teacher': 'أ. سامي راشد', 'room': '201'},
      {'time': '11:00 - 11:30', 'subject': 'فسحة', 'teacher': '', 'room': ''},
      {'time': '11:30 - 12:30', 'subject': 'العلوم', 'teacher': 'أ. خالد عبدالله', 'room': 'المعمل 1'},
      {'time': '12:30 - 1:30', 'subject': 'التربية الإسلامية', 'teacher': 'أ. عبدالله سالم', 'room': '104'},
    ],
    'الثلاثاء': [
      {'time': '8:00 - 9:00', 'subject': 'اللغة الإنجليزية', 'teacher': 'أ. سامي راشد', 'room': '103'},
      {'time': '9:00 - 10:00', 'subject': 'الرياضيات', 'teacher': 'د. علي محمود', 'room': '102'},
      {'time': '10:00 - 11:00', 'subject': 'الفيزياء', 'teacher': 'أ. خالد عبدالله', 'room': 'المعمل 2'},
      {'time': '11:00 - 11:30', 'subject': 'فسحة', 'teacher': '', 'room': ''},
      {'time': '11:30 - 12:30', 'subject': 'الكيمياء', 'teacher': 'د. سارة أحمد', 'room': 'المعمل 3'},
      {'time': '12:30 - 1:30', 'subject': 'التاريخ', 'teacher': 'أ. سامي راشد', 'room': '201'},
    ],
    'الأربعاء': [
      {'time': '8:00 - 9:00', 'subject': 'العلوم', 'teacher': 'أ. خالد عبدالله', 'room': 'المعمل 1'},
      {'time': '9:00 - 10:00', 'subject': 'اللغة العربية', 'teacher': 'أ. أحمد محمد', 'room': '101'},
      {'time': '10:00 - 11:00', 'subject': 'الرياضيات', 'teacher': 'د. علي محمود', 'room': '102'},
      {'time': '11:00 - 11:30', 'subject': 'فسحة', 'teacher': '', 'room': ''},
      {'time': '11:30 - 12:30', 'subject': 'التربية الإسلامية', 'teacher': 'أ. عبدالله سالم', 'room': '104'},
      {'time': '12:30 - 1:30', 'subject': 'اللغة الإنجليزية', 'teacher': 'أ. سامي راشد', 'room': '103'},
    ],
    'الخميس': [
      {'time': '8:00 - 9:00', 'subject': 'اللغة الإنجليزية', 'teacher': 'أ. سامي راشد', 'room': '103'},
      {'time': '9:00 - 10:00', 'subject': 'الرياضيات', 'teacher': 'د. علي محمود', 'room': '102'},
      {'time': '10:00 - 11:00', 'subject': 'العلوم', 'teacher': 'أ. خالد عبدالله', 'room': 'المعمل 1'},
      {'time': '11:00 - 11:30', 'subject': 'فسحة', 'teacher': '', 'room': ''},
      {'time': '11:30 - 12:30', 'subject': 'التاريخ', 'teacher': 'أ. سامي راشد', 'room': '201'},
      {'time': '12:30 - 1:30', 'subject': 'التربية الإسلامية', 'teacher': 'أ. عبدالله سالم', 'room': '104'},
    ],
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: scheduleData.keys.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('جدول $gradeName'),
          centerTitle: true,
          bottom: TabBar(
            tabs: scheduleData.keys.map((day) => Tab(text: day)).toList(),
            isScrollable: true,
            labelColor: Color(0xFF923CFF),          // لون البنفسجي للنصوص المحددة
            unselectedLabelColor: Color(0xFFB39DDB), // لون بنفسجي فاتح للنصوص غير المحددة
            indicatorColor: Color(0xFF923CFF),       // لون البنفسجي للمؤشر
          ),
        ),
        body: TabBarView(
          children: scheduleData.keys.map((day) {
            return DaySchedule(periods: scheduleData[day]!);
          }).toList(),
        ),
      ),
    );
  }
}

class DaySchedule extends StatelessWidget {
  final List<Map<String, String>> periods;

  const DaySchedule({required this.periods});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(8),
      itemCount: periods.length,
      itemBuilder: (context, index) {
        final period = periods[index];
        return PeriodCard(period: period);
      },
    );
  }
}

class PeriodCard extends StatelessWidget {
  final Map<String, String> period;

  const PeriodCard({required this.period});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              period['time'] ?? '',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 6),
            Text('المادة: ${period['subject'] ?? ''}'),
            Text('المعلم: ${period['teacher'] ?? ''}'),
            Text('القاعة: ${period['room'] ?? ''}'),
          ],
        ),
      ),
    );
  }
}
