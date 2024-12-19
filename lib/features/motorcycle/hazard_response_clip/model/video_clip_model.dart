// video_model.dart

class Video {
  final String url;

  Video({required this.url});

  // Convert to a map for easy JSON serialization
  Map<String, dynamic> toMap() {
    return {
      'url': url,
    };
  }

  // Convert from a map to the object (for deserialization)
  factory Video.fromMap(Map<String, dynamic> map) {
    return Video(
      url: map['url'] ?? '', // Default to empty string if null
    );
  }
}