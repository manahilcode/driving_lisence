class HighwayOtherVehiclesModel {
  final String image;
  final String text;
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final String text5;
  final String text6;
  final List<String> text7;
  final List<String> text8;
  final List<String> text9;

  HighwayOtherVehiclesModel({
    required this.image,
    required this.text,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.text5,
    required this.text6,
    required this.text7,
    required this.text8,
    required this.text9,
  });

  factory HighwayOtherVehiclesModel.fromJson(Map<String, dynamic> json) {
    return HighwayOtherVehiclesModel(
      image: json['image'] ?? '',
      text: json['text'] ?? '',
      text1: json['text1'] ?? '',
      text2: json['text2'] ?? '',
      text3: json['text3'] ?? '',
      text4: json['text4'] ?? '',
      text5: json['text5'] ?? '',
      text6: json['text6'] ?? '',
      text7: List<String>.from(json['text7'] ?? []),
      text8: List<String>.from(json['text8'] ?? []),
      text9: List<String>.from(json['text9'] ?? []),
    );
  }
}
