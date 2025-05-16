import 'package:flutter/material.dart';
import '../../Api/VideoApi.dart';
import 'VideoPlayerScreen.dart'; // تأكد أن هذا الملف موجود

class VideoListScreen extends StatefulWidget {
  @override
  _VideoListScreenState createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen> {
  List<String> videoUrls = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadVideos();
  }

  Future<void> loadVideos() async {
    try {
      final urls = await VideoService.fetchVideoUrls();
      setState(() {
        videoUrls = urls;
        isLoading = false;
      });
    } catch (e) {
      print("خطأ: $e");
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("محاضرات الفيديو")),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: videoUrls.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.video_library, size: 40, color: Colors.blue),
            title: Text('فيديو ${index + 1}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => VideoPlayerScreen(videoUrl: videoUrls[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}













// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import '../../Api/VideoApi.dart';
//
//
// class VideoListScreen extends StatefulWidget {
//   @override
//   _VideoListScreenState createState() => _VideoListScreenState();
// }
//
// class _VideoListScreenState extends State<VideoListScreen> {
//   List<String> videoUrls = [];
//   bool isLoading = true;
//
//   @override
//   void initState() {
//     super.initState();
//     loadVideos();
//   }
//
//   Future<void> loadVideos() async {
//     try {
//       final urls = await VideoService.fetchVideoUrls();
//       setState(() {
//         videoUrls = urls;
//         isLoading = false;
//       });
//     } catch (e) {
//       print("Error: $e");
//       setState(() => isLoading = false);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Video Lectures")),
//       body: isLoading
//           ? Center(child: CircularProgressIndicator())
//           : ListView.builder(
//         itemCount: videoUrls.length,
//         itemBuilder: (context, index) {
//           return VideoPlayerItem(videoUrl: videoUrls[index]);
//         },
//       ),
//     );
//   }
// }
//
// class VideoPlayerItem extends StatefulWidget {
//   final String videoUrl;
//
//   VideoPlayerItem({required this.videoUrl});
//
//   @override
//   _VideoPlayerItemState createState() => _VideoPlayerItemState();
// }
//
// class _VideoPlayerItemState extends State<VideoPlayerItem> {
//   late VideoPlayerController _controller;
//   bool initialized = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(widget.videoUrl)
//       ..initialize().then((_) {
//         setState(() {
//           initialized = true;
//         });
//       });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.all(12),
//       child: Column(
//         children: [
//           initialized
//               ? AspectRatio(
//             aspectRatio: _controller.value.aspectRatio,
//             child: VideoPlayer(_controller),
//           )
//               : Container(height: 200, child: Center(child: CircularProgressIndicator())),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               IconButton(
//                 icon: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
//                 onPressed: () {
//                   setState(() {
//                     _controller.value.isPlaying ? _controller.pause() : _controller.play();
//                   });
//                 },
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }