class HighwayCrossing11 {

  final List<String> text1;
  final List<String> text2;
  final List<String> text3;
  final List<String> text4;
  final List<String> text5;
  final List<String> text6;
  final List<String> text7;
  final List<String> text8;
  final List<String> text9;

  HighwayCrossing11({

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

  factory HighwayCrossing11.fromMap(Map<String, dynamic> map) {
    return HighwayCrossing11(

      text1: List<String>.from(map['text1'] ?? []),
      text2: List<String>.from(map['text2'] ?? []),
      text3: List<String>.from(map['text3'] ?? []),
      text4: List<String>.from(map['text4'] ?? []),
      text5: List<String>.from(map['text5'] ?? []),
      text6: List<String>.from(map['text6'] ?? []),
      text7: List<String>.from(map['text7'] ?? []),
      text8: List<String>.from(map['text8'] ?? []),
      text9: List<String>.from(map['text9'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text1': text1,
      'text2': text2,
      'text3': text3,
      'text4': text4,
      'text5': text5,
      'text6': text6,
      'text7': text7,
      'text8': text8,
      'text9': text9,

    };
  }
}
