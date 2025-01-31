class HighwayWetWeather {
  final List<String> points;

  HighwayWetWeather({required this.points});

  // Factory method to create an instance from a Firestore map
  factory HighwayWetWeather.fromMap(Map<String, dynamic> map) {
    // Convert list of points from Firestore map
    var pointsList = List<String>.from(map['points'] ?? []);
    return HighwayWetWeather(
      points: pointsList,
    );
  }

  // Method to serialize the model into a map
  Map<String, dynamic> toMap() {
    return {
      'points': points,
    };
  }
}
