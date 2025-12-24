import 'package:client/features/model/video_md.dart';
import 'package:flutter/material.dart';

class VideoTile extends StatelessWidget {
  const VideoTile({super.key, required this.videoMeta});

  final VideoMeta videoMeta;

  @override
  Widget build(BuildContext context) {

    return Text(videoMeta.title);
  }
}
