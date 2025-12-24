import 'package:client/features/viewmodel/yt_md_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VideoTile extends ConsumerWidget {
  const VideoTile({super.key, required this.videoId});

  final String videoId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videoAsync = ref.watch(videoMdVmProvider(videoId));

    return videoAsync.when(
      loading: () => const Text('loadinggg'),
      data: (video) {
        return Text(video.title);
      },
      error: (error, stack) => Text('Error: $error'),
    );
  }
}
