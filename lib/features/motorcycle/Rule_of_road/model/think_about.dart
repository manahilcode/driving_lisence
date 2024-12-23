class ThinkAboutRule {
  final List<String> subtitle;
  final String title;

  ThinkAboutRule({
    required this.subtitle,
    required this.title,
  });

  // From JSON
  factory ThinkAboutRule.fromMap(Map<String, dynamic> data) {
    return ThinkAboutRule(
      subtitle: List<String>.from(data['subtitle'] ?? []),
      title: data['title'] ?? '',
    );
  }

  // To JSON
  Map<String, dynamic> toMap() {
    return {
      'subtitle': subtitle,
      'title': title,
    };
  }
}
