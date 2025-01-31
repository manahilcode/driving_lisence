class IcySnowyWeather {
  final String image;
  final List<String> points;
  final List<String> text;
  final List<String> text1;

  IcySnowyWeather({
    required this.image,
    required this.points,
    required this.text,
    required this.text1,
  });

  // Factory constructor to create an instance from Firestore data
  factory IcySnowyWeather.fromMap(Map<String, dynamic> map) {
    return IcySnowyWeather(
      image: map['image'] ?? '',
      points: List<String>.from(map['points'] ?? []),
      text: List<String>.from(map['text'] ?? []),
      text1: List<String>.from(map['text1'] ?? []),
    );
  }
}
