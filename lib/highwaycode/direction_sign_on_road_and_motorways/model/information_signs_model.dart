class InformationSign {
  final String text;
  final List<String> title;
  final List<String> title1;
  final List<String> title2;
  final List<String> title3;
  final List<String> title4;
  final List<String> title5;
  final List<String> title6;

  InformationSign({
    required this.text,
    required this.title,
    required this.title1,
    required this.title2,
    required this.title3,
    required this.title4,
    required this.title5,
    required this.title6,
  });

  // Factory constructor to create an instance from Firestore data
  factory InformationSign.fromMap(Map<String, dynamic> map) {
    return InformationSign(
      text: map['text'] ?? '',
      title: List<String>.from(map['title'] ?? []),
      title1: List<String>.from(map['title1'] ?? []),
      title2: List<String>.from(map['title2'] ?? []),
      title3: List<String>.from(map['title3'] ?? []),
      title4: List<String>.from(map['title4'] ?? []),
      title5: List<String>.from(map['title5'] ?? []),
      title6: List<String>.from(map['title6'] ?? []),
    );
  }
}
