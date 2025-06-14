import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(Feesscreen());
}

class Feesscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'المصاريف',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: 'Tajawal',
      ),
      home: FeesScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FeesScreen extends StatefulWidget {
  @override
  _FeesScreenState createState() => _FeesScreenState();
}

class _FeesScreenState extends State<FeesScreen> {
  File? _selectedImage;

  final List<Map<String, String>> feesData = [
    {'class': 'Jr.Kg', 'annual': '1000', 'other': 'N/A'},
    {'class': 'Sr.Kg', 'annual': '1000', 'other': 'N/A'},
    {'class': 'I', 'annual': '1000', 'other': 'N/A'},
    {'class': 'II', 'annual': '1000', 'other': 'N/A'},
    {'class': 'III', 'annual': '1000', 'other': 'N/A'},
    {'class': 'IV', 'annual': '1000', 'other': 'N/A'},
    {'class': 'V', 'annual': '1000', 'other': 'N/A'},
    {'class': 'VI', 'annual': '1000', 'other': 'N/A'},
    {'class': 'VII', 'annual': '1000', 'other': 'N/A'},
    {'class': 'VIII', 'annual': '1000', 'other': 'N/A'},
    {'class': 'IX', 'annual': '1000', 'other': 'N/A'},
    {'class': 'X', 'annual': '1000', 'other': 'N/A'},
  ];

  final List<Map<String, String>> paymentAccounts = [
    {'type': 'حساب بنكي', 'number': '1234567890123456'},
    {'type': 'حساب بنكي', 'number': '9876543210987654'},
    {'type': 'فودافون كاش', 'number': '01001234567'},
    {'type': 'فودافون كاش', 'number': '01007654321'},
  ];

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF7C79B8),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
          tooltip: 'رجوع',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              decoration: BoxDecoration(
                color: Color(0xFF7C79B8),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  Icon(Icons.payment, size: 50, color: Colors.white),
                  SizedBox(height: 10),
                  Text(
                    'Student Information System',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'نظام متكامل لإدارة العملية التعليمية',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Hi, UserName ;)',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Table(
                border: TableBorder.all(color: Colors.black26),
                columnWidths: {
                  0: FlexColumnWidth(2),
                  1: FlexColumnWidth(2),
                  2: FlexColumnWidth(2),
                },
                children: [
                  TableRow(
                    decoration: BoxDecoration(color: Color(0xFF3B76B1)),
                    children: [
                      tableCell('Class', isHeader: true),
                      tableCell('Annual Fees', isHeader: true),
                      tableCell('Other Fees', isHeader: true),
                    ],
                  ),
                  ...feesData.map((fee) {
                    bool isPrimaryClass = fee['class'] == 'Jr.Kg' || fee['class'] == 'Sr.Kg';
                    return TableRow(
                      decoration: BoxDecoration(
                        color: isPrimaryClass ? Color(0xFF3B76B1) : Colors.grey[200],
                      ),
                      children: [
                        tableCell(
                          fee['class']!,
                          isBold: isPrimaryClass,
                          textColor: isPrimaryClass ? Colors.white : Colors.black,
                        ),
                        tableCell(
                          fee['annual']!,
                          textColor: isPrimaryClass ? Colors.white : Colors.black,
                        ),
                        tableCell(
                          fee['other']!,
                          textColor: isPrimaryClass ? Colors.white : Colors.black,
                        ),
                      ],
                    );
                  }).toList(),
                ],
              ),
            ),

            SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'طرق الدفع',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF7C79B8),
                    ),
                  ),
                  SizedBox(height: 10),
                  ...paymentAccounts.map((account) => Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Icon(
                        account['type'] == 'فودافون كاش' ? Icons.phone_android : Icons.account_balance,
                        color: Color(0xFF7C79B8),
                        size: 30,
                      ),
                      title: Text(
                        account['type']!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF7C79B8),
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Text(
                        account['number']!,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  )),
                  SizedBox(height: 20),

                  ElevatedButton.icon(
                    onPressed: _pickImage,
                    icon: Icon(Icons.upload_file),
                    label: Text('ارفع صورة إيصال الدفع'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF7C79B8),
                    ),
                  ),
                  SizedBox(height: 20),

                  if (_selectedImage != null)
                    Image.file(
                      _selectedImage!,
                      height: 200,
                    ),

                  SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget tableCell(String text,
      {bool isHeader = false, bool isBold = false, Color textColor = Colors.black}) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: isHeader || isBold ? FontWeight.bold : FontWeight.normal,
          color: textColor,
          fontSize: 16,
        ),
      ),
    );
  }
}
