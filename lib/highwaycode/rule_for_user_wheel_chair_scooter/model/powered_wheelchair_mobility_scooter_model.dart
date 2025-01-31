class PoweredWheelchairsAndMobilityScooters {
  final String text;
  final String text1;

  PoweredWheelchairsAndMobilityScooters({
    required this.text,
    required this.text1,
  });

  factory PoweredWheelchairsAndMobilityScooters.fromFirestore(Map<String, dynamic> data) {
    return PoweredWheelchairsAndMobilityScooters(
      text: data['text'] ?? '',
      text1: data['text1'] ?? '',
    );
  }
}
