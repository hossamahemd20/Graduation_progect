import 'package:http/http.dart' as http;
import 'dart:convert';

class VideoService {
  static const String _apiUrl = "http://127.0.0.1:8000/api/videw/get";
  static const String _bearerToken = "346|PVfwCnoN0rFdIBjbtpPPXqdgWVF77hD5uQQ0Vm8Mb9f68041"; // حط التوكن الحقيقي هنا

  static Future<List<String>> fetchVideoUrls() async {
    final response = await http.get(
      Uri.parse(_apiUrl),
      headers: {
        'Authorization': 'Bearer $_bearerToken',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List videos = data['video']['videos'];
      return videos
          .map<String>((v) => "http://127.0.0.1:8000${v['video_name']}")
          .toList();
    } else {
      throw Exception('Failed to load videos');
    }
  }
}
