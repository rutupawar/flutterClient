import 'package:client/features/view/widgets/yt_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material;

class YoutubeVideoPlayerPage extends StatelessWidget {
  const YoutubeVideoPlayerPage({super.key, required this.videoId});

  final String videoId;

  @override
  Widget build(BuildContext context) {
    return material.Scaffold(
      appBar: material.AppBar(title: const material.Text('Video Player')),
      body: Center(
        child: YoutubeVideoPlayer(videoId: videoId),
      ),
    );
  }
}