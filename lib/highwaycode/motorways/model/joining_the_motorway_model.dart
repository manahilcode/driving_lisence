class JoiningMotorwayModel {
  final String header;
  final List<String> points;

  JoiningMotorwayModel({required this.header, required this.points});

  // Factory method to create an instance from Firestore data
  factory JoiningMotorwayModel.fromMap(Map<String, dynamic> map) {
    return JoiningMotorwayModel(
      header: map['header'] ?? '',
      points: List<String>.from(map['points'] ?? []),
    );
  }
}
