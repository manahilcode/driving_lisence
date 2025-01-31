class HighwayLevelCrossingsModel {
  final String text;

  HighwayLevelCrossingsModel({required this.text});

  factory HighwayLevelCrossingsModel.fromJson(Map<String, dynamic> json) {
    return HighwayLevelCrossingsModel(
      text: json['text'] ?? '',
    );
  }
}
