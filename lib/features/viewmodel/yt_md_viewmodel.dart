import 'package:client/features/model/video_md.dart';
import 'package:client/features/model/course_md.dart';
import 'package:client/features/repositories/yt_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'yt_md_viewmodel.g.dart';

@riverpod
Future<List<VideoMeta>> playlistVideoMdVm(Ref ref, String playListId) async {
  final ytRepo = ref.watch(youtubeRepositoryProvider);
  return ytRepo.fetchPlaylistVideos(playListId);
}

@riverpod
Future<List<Course>> playlistCourseVm(Ref ref, String playListId) async {
  final ytRepo = ref.watch(youtubeRepositoryProvider);
  return ytRepo.fetchPlaylistCourses(playListId);
}

@riverpod
Future<VideoMeta> videoMdVm(Ref ref, String videoId) async {
  final ytRepo = ref.watch(youtubeRepositoryProvider);
  return ytRepo.fetchVideoMeta(videoId);
}