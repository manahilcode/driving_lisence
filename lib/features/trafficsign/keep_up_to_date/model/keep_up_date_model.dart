// lib/models/keep_up_to_date.dart
class KeepUpToDate {
  final List<String> points;
  final String text;

  KeepUpToDate({
    required this.points,
    required this.text,
  });

  /// Create our model from a Map.
  /// Expects a key "points" as an array of strings and a key "text".
  factory KeepUpToDate.fromMap(Map<String, dynamic> map) {
    List<dynamic> rawPoints = map['points'] ?? [];
    List<String> points = rawPoints.map((item) => item as String).toList();
    String text = map['text'] ?? '';
    return KeepUpToDate(points: points, text: text);
  }
}
