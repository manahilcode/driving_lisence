class SeatBeltsAndChildRestraintsModel {
  final String header;
  final String text;
  final String text1;
  final String text2;
  final List<String> text3;

  SeatBeltsAndChildRestraintsModel({
    required this.header,
    required this.text,
    required this.text1,
    required this.text2,
    required this.text3,
  });

  factory SeatBeltsAndChildRestraintsModel.fromJson(Map<String, dynamic> json) {
    return SeatBeltsAndChildRestraintsModel(
      header: json['header'] ?? '',
      text: json['text'] ?? '',
      text1: json['text1'] ?? '',
      text2: json['text2'] ?? '',
      text3: List<String>.from(json['text3'] ?? []),
    );
  }
}
