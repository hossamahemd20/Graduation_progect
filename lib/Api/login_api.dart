import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static Future<String?> loginUser({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('http://127.0.0.1:8000/api/login/students'); //

    try {
      var response = await http.post(
        url,
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        String token = data['token'];

        // تخزين التوكن في SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        bool success = await prefs.setString('auth_token', token);
        print("Token stored successfully: $success");

        return null; // معناها نجاح
      } else {
        return 'Invalid credentials';
      }
    } catch (e) {
      return 'Login error: $e';
    }
  }
}
