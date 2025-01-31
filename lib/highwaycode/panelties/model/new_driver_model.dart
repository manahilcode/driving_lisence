class HighwayNewDriversModel {
  final String text;
  final String text1;

  HighwayNewDriversModel({
    required this.text,
    required this.text1,
  });

  factory HighwayNewDriversModel.fromJson(Map<String, dynamic> json) {
    return HighwayNewDriversModel(
      text: json['text'] ?? '',
      text1: json['text1'] ?? '',
    );
  }
}
