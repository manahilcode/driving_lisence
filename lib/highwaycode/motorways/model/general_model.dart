class HighwayGeneralModel {
  final List<String> text;

  HighwayGeneralModel({required this.text});

  // Factory method to create an instance from Firestore data
  factory HighwayGeneralModel.fromMap(Map<String, dynamic> map) {
    return HighwayGeneralModel(
      text: List<String>.from(map['text'] ?? []),
    );
  }
}
