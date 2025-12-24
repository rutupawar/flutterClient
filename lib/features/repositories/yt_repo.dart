import 'dart:convert';

import 'package:client/features/model/video_md.dart';
import 'package:client/features/model/course_md.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'yt_repo.g.dart';

@riverpod
YoutubeRepository youtubeRepository(Ref ref) {
  return YoutubeRepository();
}

class YoutubeRepository {
  static const String _apiKey = 'AIzaSyDd9f_nyBwg0OfxJz4mVFRzvcb3oEBNkg4';

  Future<VideoMeta> fetchVideoMeta(String videoId) async {
    final uri = Uri.https('www.googleapis.com', '/youtube/v3/videos', {
      'part': 'snippet',
      'id': videoId,
      'key': _apiKey,
    });

    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw Exception('Failed to load video metadata');
    }

    final body = jsonDecode(response.body);
    final items = body['items'] as List<dynamic>;

    if (items.isEmpty) {
      throw Exception('Video not found');
    }

    return VideoMeta.fromJson(items.first);
  }

  Future<List<VideoMeta>> fetchPlaylistVideos(String playListId) async {
    final uri = Uri.https('www.googleapis.com', '/youtube/v3/playlistItems', {
      'part': 'snippet',
      'playlistId': playListId,
      'maxResults': '50',
      'key': _apiKey,
    });

    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw Exception('Failed to load playlist videos');
    }

    final body = jsonDecode(response.body);
    final items = body['items'] as List<dynamic>;

    return items.map((item) => VideoMeta.fromJson(item)).toList();
  }

  Future<List<Course>> fetchPlaylistCourses(String playListId) async {
    final uri = Uri.https('www.googleapis.com', '/youtube/v3/playlists', {
      'part': 'snippet',
      'id': playListId,
      'key': _apiKey,
    });

    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw Exception('Failed to load playlist metadata');
    }

    final body = jsonDecode(response.body);
    final items = body['items'] as List<dynamic>;

    return items.map((item) {
      final snippet = item['snippet'];
      return Course(
        id: playListId,
        title: snippet['title'],
        description: snippet['description'],
        thumbnailUrl: snippet['thumbnails']['medium']['url'],
      );
    }).toList();
  }
}
