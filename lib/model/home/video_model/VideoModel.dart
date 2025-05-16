class VideoModel {
  final String videoName;

  VideoModel({required this.videoName});

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      videoName: json['video_name'],
    );
  }

  String getFullUrl() {
    return 'http://127.0.0.1:8000$videoName';
  }
}