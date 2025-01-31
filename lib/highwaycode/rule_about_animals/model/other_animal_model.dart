class HighwayCodeOtherAnimalsModel {
  final List<String> text;
  final List<String> text1;

  HighwayCodeOtherAnimalsModel({
    required this.text,
    required this.text1,
  });

  factory HighwayCodeOtherAnimalsModel.fromJson(Map<String, dynamic> json) {
    return HighwayCodeOtherAnimalsModel(
      text: List<String>.from(json['text'] ?? []),
      text1: List<String>.from(json['text1'] ?? []),
    );
  }
}
