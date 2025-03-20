import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class VideoLectureView extends StatefulWidget {
  final String videoUrl;

  const VideoLectureView({super.key, required this.videoUrl});

  @override
  State<VideoLectureView> createState() => _VideoLectureViewState();
}

class _VideoLectureViewState extends State<VideoLectureView> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    await _videoPlayerController.initialize();

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: false,
    );

    setState(() {}); // لتحديث الواجهة بعد التهيئة
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Video Lecture"),
        centerTitle: true,
      ),
      body: _chewieController != null &&
          _chewieController!.videoPlayerController.value.isInitialized
          ? Padding(
        padding: const EdgeInsets.all(12.0),
        child: Chewie(controller: _chewieController!),
      )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
