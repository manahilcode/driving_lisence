class HighwayBePrepared {
  final String text;

  HighwayBePrepared({
    required this.text,
  });

  factory HighwayBePrepared.fromMap(Map<String, dynamic> map) {
    return HighwayBePrepared(
      text: map['text'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
    };
  }
}
