import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthService {
  static Future<String?> loginUser({
    required String email,
    required String password,
  }) async {
    var url = Uri.parse("http://10.0.2.2:8000/api/login/student");

    try {
      var response = await http.post(
        url,
        body: {
          'email': email.trim(),
          'password': password.trim(),
        },
      );

      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);

        if (responseData.containsKey('token')) {
          // تسجيل ناجح - رجّع التوكن
          return null; // null معناها نجاح
        } else if (responseData.containsKey('massage')) {
          // فشل - رسالة خطأ
          return responseData['massage']; // رجّع رسالة الخطأ
        } else {
          // رد غير متوقع
          return "Unexpected response from server.";
        }
      } else {
        return "Login failed with status: ${response.statusCode}";
      }
    } catch (e) {
      print("Error: $e");
      return "An error occurred: $e";
    }
  }
}
