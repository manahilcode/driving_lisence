class ProvideEmergencyCare {
  final String text;
  final String text1;

  ProvideEmergencyCare({
    required this.text,
    required this.text1,
  });

  factory ProvideEmergencyCare.fromMap(Map<String, dynamic> map) {
    return ProvideEmergencyCare(
      text: map['text'] ?? '',
      text1: map['text1'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'text1': text1,
    };
  }
}
