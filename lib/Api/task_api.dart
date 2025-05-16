import 'dart:convert';
import 'package:http/http.dart' as http;

class TaskApi {
  static const String _baseUrl = 'http://192.168.1.58:8000/api/task/get';

  static Future<List<String>> getTasks() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        print("Response body: ${response.body}");

        final jsonData = json.decode(response.body);

        if (jsonData['status'] == true && jsonData['data'] != null) {
          final tasks = jsonData['data']['tasks'] as List<dynamic>;

          // استخراج روابط المهام
          List<String> taskUrls = tasks
              .map((taskItem) => "192.168.1.58:8000/api/task/get${taskItem['task']}")
              .toList();

          return taskUrls;
        } else {
          throw Exception("الاستجابة غير متوقعة من السيرفر");
        }
      } else {
        throw Exception("فشل الاتصال بالسيرفر: ${response.statusCode}");
      }
    } catch (e) {
      print("حدث خطأ: $e");
      return []; // رجّع قائمة فاضية عند حدوث خطأ
    }
  }
}
