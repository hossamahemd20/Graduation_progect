import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../model/Subject_Model/Subject_Model.dart';

class SubjectApi {
  static Future<List<SubjectModel>> fetchSubjects(String token) async {
    try {
      final url = Uri.parse("http://127.0.0.1:8000/api/subjet/get");

      final response = await http.get(
        url,
        headers: {
          
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      ).timeout(Duration(seconds: 20)); // Timeout set to 20 seconds

      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        print("Response Body: $responseBody");  // طباعة الاستجابة لمعرفة محتواها


        if (responseBody['status'] == true && responseBody['subject'] != null) {
          // تحويل البيانات المسترجعة إلى List من SubjectModel
          return (responseBody['subject'] as List)
              .map((e) => SubjectModel.fromJson(e))
              .toList();
        } else {
          throw Exception("No subjects data available");
        }
      } else {
        throw Exception("Server error: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Error fetching subjects: $e");
      // التأكد من طباعة الخطأ الصحيح
      if (e is http.ClientException) {
        throw Exception("Network error: ${e.message}");
      } else if (e is TimeoutException) {
        throw Exception("The request timed out. Please try again.");
      } else {
        throw Exception("Failed to load subjects: ${e.toString()}");
      }
    }
  }
}
