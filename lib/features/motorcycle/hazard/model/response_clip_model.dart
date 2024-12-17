class VideoList {
  final List<String> videos;

  VideoList({required this.videos});

  // Convert the list to a map for easy JSON serialization
  Map<String, dynamic> toMap() {
    return {
      'videos': videos.isNotEmpty ? videos : [], // Handle empty or null list
    };
  }

  // Convert from a map to the object (for deserialization)
  factory VideoList.fromMap(Map<String, dynamic> map) {
    return VideoList(
      videos: map['videos'] != null ? List<String>.from(map['videos']) : [], // Ensure the list is not null
    );
  }
}
