class HazardAwarenessThingsDiscuss {
  final String title;           // Title for the section
  final String title1;          // Title for the "Discuss with your trainer" section
  final String title2;          // Title for the "Practise with your trainer" section
  final String subtitle;        // Subtitle explaining hazard awareness
  final List<String> points;    // Points for "Things to discuss and practise"
  final List<String> points1;   // Additional points for "Practise with your trainer"

  HazardAwarenessThingsDiscuss({
    required this.title,
    required this.title1,
    required this.title2,
    required this.subtitle,
    required this.points,
    required this.points1,
  });

  // Factory method to create a model from Firestore data
  factory HazardAwarenessThingsDiscuss.fromFirestore(Map<String, dynamic> data) {
    return HazardAwarenessThingsDiscuss(
      title: data['title'] ?? '',
      title1: data['title1'] ?? '',
      title2: data['title2'] ?? '',
      subtitle: data['subtitle'] ?? '',
      points: List<String>.from(data['points'] ?? []),
      points1: List<String>.from(data['points1'] ?? []),
    );
  }
}
