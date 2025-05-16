// lib/providers/auth_provider.dart
import 'package:flutter/foundation.dart';
import '../token_helper/token_helper.dart';

class AuthProvider with ChangeNotifier {
  String? _token;
  String? _email;

  String? get token => _token;
  String? get email => _email;

  Future<void> login(String email, String token) async {
    await TokenHelper.saveToken(token);
    _token = token;
    _email = email;
    notifyListeners();
  }

  Future<void> autoLogin() async {
    _token = await TokenHelper.getToken();
    // يمكنك إضافة استدعاء API لمعرفة الإيميل من التوكن
    if (_token != null) {
      _email = await _fetchEmailFromToken(_token!);
      notifyListeners();
    }
  }

  Future<String> _fetchEmailFromToken(String token) async {
    // استدعاء API لمعرفة الإيميل
    return "student@example.com"; // مؤقت
  }
}