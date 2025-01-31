class HighwayFirstAidOnTheRoad {
  final String text;

  HighwayFirstAidOnTheRoad({
    required this.text,
  });

  factory HighwayFirstAidOnTheRoad.fromMap(Map<String, dynamic> map) {
    return HighwayFirstAidOnTheRoad(
      text: map['text'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
    };
  }
}
