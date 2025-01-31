
class SafetyCodeForNewDrivers {
  final String text;
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final String text5;
  final String text6;
  final String text7;

  SafetyCodeForNewDrivers({
    required this.text,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.text5,
    required this.text6,
    required this.text7,
  });

  factory SafetyCodeForNewDrivers.fromMap(Map<String, dynamic> map) {
    return SafetyCodeForNewDrivers(
      text: map['text'] ?? '',
      text1: map['text1'] ?? '',
      text2: map['text2'] ?? '',
      text3: map['text3'] ?? '',
      text4: map['text4'] ?? '',
      text5: map['text5'] ?? '',
      text6: map['text6'] ?? '',
      text7: map['text7'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'text1': text1,
      'text2': text2,
      'text3': text3,
      'text4': text4,
      'text5': text5,
      'text6': text6,
      'text7': text7,
    };
  }
}
