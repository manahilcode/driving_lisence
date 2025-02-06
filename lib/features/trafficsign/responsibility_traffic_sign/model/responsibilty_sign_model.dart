// lib/models/responsibility_for_traffic_signs.dart
class ResponsibilityForTrafficSigns {
  final List<String> points;
  final String text;
  final String text1;
  final String text2;

  ResponsibilityForTrafficSigns({
    required this.points,
    required this.text,
    required this.text1,
    required this.text2,
  });

  /// Factory method to create a model from a Map.
  /// Expects keys: 'points', 'text', 'text1', and 'text2'
  factory ResponsibilityForTrafficSigns.fromMap(Map<String, dynamic> map) {
    // Ensure the points are converted to a list of strings.
    List<dynamic> rawPoints = map['points'] ?? [];
    List<String> points = rawPoints.map((item) => item.toString()).toList();

    return ResponsibilityForTrafficSigns(
      points: points,
      text: map['text'] ?? '',
      text1: map['text1'] ?? '',
      text2: map['text2'] ?? '',
    );
  }
}
