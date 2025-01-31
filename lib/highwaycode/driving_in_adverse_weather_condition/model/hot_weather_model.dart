class HighWayHotWeather {
  final String text;

  HighWayHotWeather({required this.text});

  // Factory constructor to create an instance from Firestore data
  factory HighWayHotWeather.fromMap(Map<String, dynamic> map) {
    return HighWayHotWeather(
      text: map['text'] ?? '',
    );
  }
}
