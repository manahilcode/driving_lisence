class HazardAwarenessThinkAbout {
  final String title;           // Title for the section
  final List<String> points;    // Points for discussion

  HazardAwarenessThinkAbout({
    required this.title,
    required this.points,
  });

  // Factory method to create a model from Firestore data
  factory HazardAwarenessThinkAbout.fromFirestore(Map<String, dynamic> data) {
    return HazardAwarenessThinkAbout(
      title: data['title'] ?? '',
      points: List<String>.from(data['points'] ?? []),
    );
  }
}
