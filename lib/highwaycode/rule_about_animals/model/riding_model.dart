class HighwayCodeRidingModel {
  final String text;
  final List<String> text1;
  final String text2;
  final String text3;

  HighwayCodeRidingModel({
    required this.text,
    required this.text1,
    required this.text2,
    required this.text3,
  });

  factory HighwayCodeRidingModel.fromJson(Map<String, dynamic> json) {
    return HighwayCodeRidingModel(
      text: json['text'] ?? '',
      text1: List<String>.from(json['text1'] ?? []),
      text2: json['text2'] ?? '',
      text3: json['text3'] ?? '',
    );
  }
}
