class HighwayHorseRidersModel {
  final String text;
  final List<String> text1;
  final List<String> text2;

  HighwayHorseRidersModel({
    required this.text,
    required this.text1,
    required this.text2,
  });

  factory HighwayHorseRidersModel.fromJson(Map<String, dynamic> json) {
    return HighwayHorseRidersModel(
      text: json['text'] ?? '',
      text1: List<String>.from(json['text1'] ?? []),
      text2: List<String>.from(json['text2'] ?? []),
    );
  }
}
