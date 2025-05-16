import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class PDFViewerScreen extends StatefulWidget {
  final String url; // <-- سمه url بدل filePath

  const PDFViewerScreen({required this.url});

  @override
  _PDFViewerScreenState createState() => _PDFViewerScreenState();
}

class _PDFViewerScreenState extends State<PDFViewerScreen> {
  String localPath = '';

  @override
  void initState() {
    super.initState();
    _downloadFile(widget.url); // <-- استخدم url الحقيقي هنا
  }

  Future<void> _downloadFile(String url) async {
    // await Permission.storage.request();
    //
    // if (await Permission.storage.isGranted) {
    //   final directory = await getApplicationDocumentsDirectory();
    //   final filePath = '${directory.path}/task.pdf';
    //
    //   final response = await http.get(Uri.parse(url));
    //   final file = File(filePath);
    //   await file.writeAsBytes(response.bodyBytes);
    //
    //   setState(() {
    //     localPath = filePath;
    //   });
    // } else {
    //   print("Permission Denied");
    // }
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/task.pdf';

    final response = await http.get(Uri.parse(url));
    final file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);

    setState(() {
      localPath = filePath;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('عرض الملف')),
      body: localPath.isEmpty
          ? Center(child: CircularProgressIndicator())
          : PDFView(
        filePath: localPath,
        enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: true,
        pageFling: true,
        pageSnap: true,
        defaultPage: 0,
        fitPolicy: FitPolicy.BOTH,
      ),
    );
  }
}
