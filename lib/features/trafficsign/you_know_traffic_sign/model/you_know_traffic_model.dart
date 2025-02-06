// lib/models/traffic_sign_info.dart
class TrafficSignInfo44 {
  final String text;

  TrafficSignInfo44({
    required this.text,
  });

  factory TrafficSignInfo44.fromMap(Map<String, dynamic> map) {
    return TrafficSignInfo44(
      text: map['text'] ?? '',
    );
  }
}
