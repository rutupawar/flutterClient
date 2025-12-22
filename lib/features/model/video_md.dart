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
    final snippet = json['snippet'];
    return VideoMeta(
      videoId: json['id'],
      title: snippet['title'],
      description: snippet['description'],
      thumbnailUrl: snippet['thumbnails']['medium']['url'],
      channelTitle: snippet['channelTitle'],
    );
  }
}
