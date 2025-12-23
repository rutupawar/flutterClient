import 'package:client/features/viewmodel/playlist_video_md_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VideoList extends ConsumerWidget{
  const VideoList({super.key, required this.playListId});

  final String playListId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final videoListAsync = ref.watch(playlistVideoMdVmProvider(playListId));

    return videoListAsync.when(
      loading: () => const Text('loadinggg'),
      data: (videoList) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: videoList.length,
          itemBuilder: (context, index) {
            final video = videoList[index];
            return ListTile(
              title: Text(video.title),
              subtitle: Text(video.videoId),
            );
          },
        );
      },
      error: (error, stack) => Text('E1rror: $error'),
    );
  }
}