class BeforeSettingOffModel {
  final String image;
  final List<String> points;
  final List<String> text;

  BeforeSettingOffModel({
    required this.image,
    required this.points,
    required this.text,
  });

  factory BeforeSettingOffModel.fromJson(Map<String, dynamic> json) {
    return BeforeSettingOffModel(
      image: json['image'] ?? '',
      points: List<String>.from(json['points'] ?? []),
      text: List<String>.from(json['text'] ?? []),
    );
  }
}
