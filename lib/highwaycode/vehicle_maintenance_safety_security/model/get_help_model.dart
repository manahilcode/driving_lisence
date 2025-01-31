class HighwayGetHelp {
  final String text;

  HighwayGetHelp({
    required this.text,
  });

  factory HighwayGetHelp.fromMap(Map<String, dynamic> map) {
    return HighwayGetHelp(
      text: map['text'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
    };
  }
}
