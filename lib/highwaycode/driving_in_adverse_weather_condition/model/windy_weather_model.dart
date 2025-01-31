class WindyWeatherModelWindyWeather {
  final String text;
  final String text1;

  WindyWeatherModelWindyWeather({
    required this.text,
    required this.text1,
  });

  // Factory method to create an instance from a Firestore map
  factory WindyWeatherModelWindyWeather.fromMap(Map<String, dynamic> map) {
    return WindyWeatherModelWindyWeather(
      text: map['text'] ?? '',
      text1: map['text1'] ?? '',
    );
  }

  // Method to serialize the model into a map
  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'text1': text1,
    };
  }
}
