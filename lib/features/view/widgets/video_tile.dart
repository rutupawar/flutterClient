import 'package:client/features/model/video_md.dart';
import 'package:client/features/view/pages/yt_video_player_page.dart';
import 'package:flutter/material.dart';

class VideoTile extends StatelessWidget {
  const VideoTile({super.key, required this.videoMeta});

  final VideoMeta videoMeta;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                YoutubeVideoPlayerPage(videoId: videoMeta.videoId),
          ),
        );
      },
      leading: Image.network(videoMeta.thumbnailUrl),
      title: Text(
        videoMeta.title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      subtitle: Text(
        videoMeta.description,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
