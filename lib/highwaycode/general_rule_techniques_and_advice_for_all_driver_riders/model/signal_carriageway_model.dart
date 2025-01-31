// Model class for SignalCarriageway
class SignalCarriageway {
  final List<String> points;

  SignalCarriageway({
    required this.points,
  });

  // Factory constructor to create an instance from Firestore data
  factory SignalCarriageway.fromFirestore(Map<String, dynamic> data) {
    return SignalCarriageway(
      points: List<String>.from(data['points'] ?? []),
    );
  }

  // Convert the instance to a map (for saving to Firestore if needed)
  Map<String, dynamic> toMap() {
    return {
      'points': points,
    };
  }
}