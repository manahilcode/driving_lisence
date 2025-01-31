class FitnessToDriveModel {
  final String text;
  final String text1;
  final String text2;
  final List<String> text3;

  FitnessToDriveModel({
    required this.text,
    required this.text1,
    required this.text2,
    required this.text3,
  });

  factory FitnessToDriveModel.fromJson(Map<String, dynamic> json) {
    return FitnessToDriveModel(
      text: json['text'] ?? '',
      text1: json['text1'] ?? '',
      text2: json['text2'] ?? '',
      text3: List<String>.from(json['text3'] ?? []),
    );
  }
}
