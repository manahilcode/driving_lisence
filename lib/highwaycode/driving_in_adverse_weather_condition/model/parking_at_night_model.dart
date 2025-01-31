class ParkingAtNight {
  final String image;
  final List<String> points;
  final String text;
  final String text1;
  final String text2;

  ParkingAtNight({
    required this.image,
    required this.points,
    required this.text,
    required this.text1,
    required this.text2,
  });

  // Factory method to create an instance from a Firestore map
  factory ParkingAtNight.fromMap(Map<String, dynamic> map) {
    return ParkingAtNight(
      image: map['image'] ?? '',
      points: List<String>.from(map['points'] ?? []),
      text: map['text'] ?? '',
      text1: map['text1'] ?? '',
      text2: map['text2'] ?? '',
    );
  }

//
}