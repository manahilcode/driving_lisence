class PenaltiesAndHighwayCodeModel {
  final String text;

  PenaltiesAndHighwayCodeModel({
    required this.text,
  });

  factory PenaltiesAndHighwayCodeModel.fromJson(Map<String, dynamic> json) {
    return PenaltiesAndHighwayCodeModel(
      text: json['text'] ?? '',
    );
  }
}
