
class AlertnessData {
  final String imageUrl;
  final List<String> points;
  final String subtitle;
  final String title;

  AlertnessData({
    required this.imageUrl,
    required this.points,
    required this.subtitle,
    required this.title,
  });

  // Factory constructor to create an instance from Firebase document
  factory AlertnessData.fromFirestore(Map<String, dynamic> json) {
    return AlertnessData(
      imageUrl: json['image'] as String,
      points: List<String>.from(json['points'] ?? []),
      subtitle: json['subtitle'] as String,
      title: json['title'] as String,
    );
  }
}
