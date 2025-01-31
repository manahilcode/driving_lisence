class VehicleMaintenance {
  final List<String> points;
  final List<String> text;
  final String text1;
  final List<String> text2;
  final List<String> type;

  VehicleMaintenance({
    required this.points,
    required this.text,
    required this.text1,
    required this.text2,
    required this.type,
  });

  factory VehicleMaintenance.fromMap(Map<String, dynamic> map) {
    return VehicleMaintenance(
      points: List<String>.from(map['points'] ?? []),
      text: List<String>.from(map['text'] ?? []),
      text1: map['text1'] ?? '',
      text2: List<String>.from(map['text2'] ?? []),
      type: List<String>.from(map['type'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'points': points,
      'text': text,
      'text1': text1,
      'text2': text2,
      'type': type,
    };
  }
}
