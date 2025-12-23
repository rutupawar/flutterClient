import 'package:client/features/model/video_md.dart';
import 'package:client/features/repositories/yt_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'video_md_viewmodel.g.dart';

@riverpod
Future<VideoMeta> videoMdVm(Ref ref, String videoId) async {
  final ytRepo = ref.watch(youtubeRepositoryProvider);
  return ytRepo.fetchVideoMeta(videoId);
}
