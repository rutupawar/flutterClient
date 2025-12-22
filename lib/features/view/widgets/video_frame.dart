import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

/// A widget that embeds a YouTube video by `videoId`.
///
/// Example:
/// ```dart
/// VideoFrame(videoId: 'dQw4w9WgXcQ')
/// ```
class VideoFrame extends StatefulWidget {
  const VideoFrame({super.key, required this.videoId});

  final String videoId;

  @override
  State<VideoFrame> createState() => _VideoFrameState();
}

class _VideoFrameState extends State<VideoFrame> {
  late final YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController.fromVideoId(
      videoId: widget.videoId,
      params: const YoutubePlayerParams(
        showControls: true,
      ),
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 900),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: YoutubePlayer(
          controller: _controller,
        ),
      ),
    );
  }
}
