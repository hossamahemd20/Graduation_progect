class VideoModel {
  final String videoName;

  VideoModel({required this.videoName});

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      videoName: json['video_name'],
    );
  }

  String getFullUrl() {
    return 'http://192.168.1.58:8000$videoName';
  }
}
