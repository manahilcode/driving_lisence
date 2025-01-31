class VehicleSecurity {
  final List<String> points;

  VehicleSecurity({
    required this.points,
  });

  factory VehicleSecurity.fromMap(Map<String, dynamic> map) {
    return VehicleSecurity(
      points: List<String>.from(map['points'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'points': points,
    };
  }
}
