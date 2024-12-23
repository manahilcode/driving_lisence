class ThinkAboutModelLoading {
  final List<String> subtitle;
  final String title;

  ThinkAboutModelLoading({
    required this.subtitle,
    required this.title,
  });

  // Factory method to create ThinkAboutModel from a map
  factory ThinkAboutModelLoading.fromMap(Map<String, dynamic> map) {
    return ThinkAboutModelLoading(
      subtitle: List<String>.from(map['subtitle'] ?? []),
      title: map['title'] as String,
    );
  }

  // Convert ThinkAboutModel to a map
  Map<String, dynamic> toMap() {
    return {
      'subtitle': subtitle,
      'title': title,
    };
  }
}
