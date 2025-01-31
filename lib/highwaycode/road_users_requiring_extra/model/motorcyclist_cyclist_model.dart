class MotorcyclistsAndCyclistsModel {
  final String image;
  final String text;
  final String text1;
  final String text2;
  final String text3;
  final String text4;

  MotorcyclistsAndCyclistsModel({
    required this.image,
    required this.text,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
  });

  factory MotorcyclistsAndCyclistsModel.fromJson(Map<String, dynamic> json) {
    return MotorcyclistsAndCyclistsModel(
      image: json['image'] ?? '',
      text: json['text'] ?? '',
      text1: json['text1'] ?? '',
      text2: json['text2'] ?? '',
      text3: json['text3'] ?? '',
      text4: json['text4'] ?? '',
    );
  }
}
