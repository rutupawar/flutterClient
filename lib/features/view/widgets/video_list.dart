import 'package:client/features/view/widgets/video_tile.dart';
import 'package:client/features/viewmodel/yt_md_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VideoList extends ConsumerWidget {
  const VideoList({super.key, required this.playListId});

  final String playListId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videoListAsync = ref.watch(playlistVideoMdVmProvider(playListId));

    return videoListAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (videoList) {
        return Scaffold(
          appBar: AppBar(title: const Text('Course lessons')),
          body: ListView.builder(
            itemCount: videoList.length,
            itemBuilder: (context, index) {
              final video = videoList[index];
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: VideoTile(videoMeta: video),
              );
            },
          ),
        );
      },
      error: (error, stack) => Text('Error: $error'),
    );
  }
}
