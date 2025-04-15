

import 'package:flutter/material.dart';



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

class GradeSelectionScreen extends StatefulWidget {
  @override
  _GradeSelectionScreenState createState() => _GradeSelectionScreenState();
}

class _GradeSelectionScreenState extends State<GradeSelectionScreen> {
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
                  builder: (context) => ScheduleScreen(gradeName: grades[index]['name']),
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

class ScheduleScreen extends StatefulWidget {
  final String gradeName;

  ScheduleScreen({required this.gradeName});

  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
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
      {'time': '8:00 - 9:00', 'subject': 'التاريخ', 'teacher': 'أ. سارة أحمد', 'room': '105'},
      {'time': '9:00 - 10:00', 'subject': 'الجغرافيا', 'teacher': 'أ. ليلى عمر', 'room': '106'},
      {'time': '10:00 - 11:00', 'subject': 'الفيزياء', 'teacher': 'د. ناصر علي', 'room': 'المعمل 2'},
      {'time': '11:00 - 11:30', 'subject': 'فسحة', 'teacher': '', 'room': ''},
      {'time': '11:30 - 12:30', 'subject': 'الكيمياء', 'teacher': 'أ. هدى مصطفى', 'room': 'المعمل 3'},
      {'time': '12:30 - 1:30', 'subject': 'التربية الفنية', 'teacher': 'أ. إبراهيم فتحي', 'room': 'الاستوديو'},
    ],
    'الثلاثاء': [
      {'time': '8:00 - 9:00', 'subject': 'علوم الحاسب', 'teacher': 'د. محمد ناصر', 'room': 'المعمل 4'},
      {'time': '9:00 - 10:00', 'subject': 'الأحياء', 'teacher': 'أ. نورا عبدالرحمن', 'room': 'المعمل 5'},
      {'time': '10:00 - 11:00', 'subject': 'اللغة الفرنسية', 'teacher': 'أ. ياسمين كمال', 'room': '107'},
      {'time': '11:00 - 11:30', 'subject': 'فسحة', 'teacher': '', 'room': ''},
      {'time': '11:30 - 12:30', 'subject': 'التربية الرياضية', 'teacher': 'أ. محمود رياض', 'room': 'الملعب'},
      {'time': '12:30 - 1:30', 'subject': 'علم الاجتماع', 'teacher': 'د. هناء علي', 'room': '108'},
    ],
    'الأربعاء': [
      {'time': '8:00 - 9:00', 'subject': 'اللغة العربية', 'teacher': 'أ. أحمد محمد', 'room': '101'},
      {'time': '9:00 - 10:00', 'subject': 'الرياضيات', 'teacher': 'د. علي محمود', 'room': '102'},
      {'time': '10:00 - 11:00', 'subject': 'التربية الوطنية', 'teacher': 'أ. فارس خالد', 'room': '103'},
      {'time': '11:00 - 11:30', 'subject': 'فسحة', 'teacher': '', 'room': ''},
      {'time': '11:30 - 12:30', 'subject': 'الاقتصاد المنزلي', 'teacher': 'أ. منى سعيد', 'room': 'المعمل 6'},
      {'time': '12:30 - 1:30', 'subject': 'المهارات الحياتية', 'teacher': 'أ. وائل كمال', 'room': '104'},
    ],
    'الخميس': [
      {'time': '8:00 - 9:00', 'subject': 'اللغة الإنجليزية', 'teacher': 'أ. سامي راشد', 'room': '103'},
      {'time': '9:00 - 10:00', 'subject': 'التربية الإسلامية', 'teacher': 'أ. عبدالله سالم', 'room': '104'},
      {'time': '10:00 - 11:00', 'subject': 'النشاط العلمي', 'teacher': 'أ. خالد عبدالله', 'room': '105'},
      {'time': '11:00 - 11:30', 'subject': 'فسحة', 'teacher': '', 'room': ''},
      {'time': '11:30 - 12:30', 'subject': 'التربية الفنية', 'teacher': 'أ. إبراهيم فتحي', 'room': 'الاستوديو'},
      {'time': '12:30 - 1:30', 'subject': 'التربية الرياضية', 'teacher': 'أ. محمود رياض', 'room': 'الملعب'},
    ],
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: scheduleData.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('جدول ${widget.gradeName}'),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          bottom: TabBar(
            isScrollable: true,
            tabs: scheduleData.keys.map((day) => Tab(text: day)).toList(),
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
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  period['time'] ?? '',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                if ((period['subject'] ?? '').isNotEmpty)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: _getSubjectColor(period['subject'] ?? ''),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      period['subject'] ?? '',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
              ],
            ),
            if ((period['subject'] ?? '').isNotEmpty) ...[
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.person, size: 16, color: Colors.grey),
                  SizedBox(width: 4),
                  Text('المدرس: ${period['teacher'] ?? ''}'),
                ],
              ),
              SizedBox(height: 4),
              Row(
                children: [
                  Icon(Icons.room, size: 16, color: Colors.grey),
                  SizedBox(width: 4),
                  Text('القاعة: ${period['room'] ?? ''}'),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Color _getSubjectColor(String subject) {
    final colors = {
      'اللغة العربية': Colors.green,
      'الرياضيات': Colors.blue,
      'العلوم': Colors.teal,
      'اللغة الإنجليزية': Colors.purple,
      'التربية الإسلامية': Colors.orange,
      'التاريخ': Colors.brown,
      'الجغرافيا': Colors.indigo,
      'الفيزياء': Colors.blueAccent,
      'الكيمياء': Colors.deepPurple,
      'علوم الحاسب': Colors.cyan,
      'الأحياء': Colors.lightGreen,
      'اللغة الفرنسية': Colors.pink,
      'التربية الوطنية': Colors.amber,
      'الاقتصاد المنزلي': Colors.deepOrange,
      'المهارات الحياتية': Colors.lime,
      'النشاط العلمي': Colors.cyanAccent,
      'التربية الفنية': Colors.pinkAccent,
      'التربية الرياضية': Colors.red,
      'علم الاجتماع': Colors.blueGrey,
    };
    return colors[subject] ?? Colors.grey;
  }
}