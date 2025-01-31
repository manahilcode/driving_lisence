class LeavingMotorwayModel {
  final String text;
  final List<String> text1;
  final String text2;

  LeavingMotorwayModel({
    required this.text,
    required this.text1,
    required this.text2,
  });

  // Factory method to create an instance from Firestore data
  factory LeavingMotorwayModel.fromMap(Map<String, dynamic> map) {
    return LeavingMotorwayModel(
      text: map['text'] ?? '',
      text1: List<String>.from(map['text1'] ?? []),
      text2: map['text2'] ?? '',
    );
  }
}
