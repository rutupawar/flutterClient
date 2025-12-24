class VideoMeta {
  final String videoId;
  final String title;
  final String description;
  final String thumbnailUrl;
  final String channelTitle;

  VideoMeta({
    required this.videoId,
    required this.title,
    required this.description,
    required this.thumbnailUrl,
    required this.channelTitle,
  });

  factory VideoMeta.fromJson(Map<String, dynamic> json) {
    final snippet = json['snippet'] ?? json;
    
    // Handle different API response formats
    String videoId;
    if (json['id'] is String) {
      videoId = json['id'];
    } else if (json['id'] is Map) {
      videoId = json['id']['videoId'];
    } else if (json['resourceId'] != null) {
      videoId = json['resourceId']['videoId'];
    } else if (snippet['resourceId'] != null) {
      videoId = snippet['resourceId']['videoId'];
    } else {
      throw Exception('Unable to extract videoId from JSON');
    }
    
    return VideoMeta(
      videoId: videoId,
      title: snippet['title'] ?? '',
      description: snippet['description'] ?? '',
      thumbnailUrl: snippet['thumbnails']?['medium']?['url'] ?? '',
      channelTitle: snippet['channelTitle'] ?? '',
    );
  }
}
