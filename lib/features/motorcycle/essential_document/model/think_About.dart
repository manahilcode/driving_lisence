class ThinkAboutDocument {
  final List<String> points;
  final String title;

  ThinkAboutDocument({
    required this.points,
    required this.title,
  });

  factory ThinkAboutDocument.fromMap(Map<String, dynamic> map) {
    return ThinkAboutDocument(
      points: List<String>.from(map['points'] ?? []),
      title: map['title'] ?? '',
    );
  }
}
