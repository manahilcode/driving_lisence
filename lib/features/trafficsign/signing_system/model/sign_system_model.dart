// lib/models/sign_system.dart
class SignSystem321 {
  final List<String> images;
  final String text;
  final List<String> text1;

  SignSystem321({
    required this.images,
    required this.text,
    required this.text1,
  });

  /// Factory constructor to create a SignSystem model from a Map.
  factory SignSystem321.fromMap(Map<String, dynamic> map) {
    return SignSystem321(
      images: List<String>.from(map['images'] ?? []),
      text: map['text'] ?? '',
      text1: List<String>.from(map['text1'] ?? []),
    );
  }
}
