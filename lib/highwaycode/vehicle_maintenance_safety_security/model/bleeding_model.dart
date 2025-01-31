class HighwayBleeding {
  final String text;

  HighwayBleeding({
    required this.text,
  });

  factory HighwayBleeding.fromMap(Map<String, dynamic> map) {
    return HighwayBleeding(
      text: map['text'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
    };
  }
}
