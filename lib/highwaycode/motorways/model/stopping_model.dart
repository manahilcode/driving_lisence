class HighwayStoppingModel {
  final String image;
  final String text;
  final String text1;

  HighwayStoppingModel({
    required this.image,
    required this.text,
    required this.text1,
  });

  factory HighwayStoppingModel.fromJson(Map<String, dynamic> json) {
    return HighwayStoppingModel(
      image: json['image'] ?? '',
      text: json['text'] ?? '',
      text1: json['text1'] ?? '',
    );
  }
}
