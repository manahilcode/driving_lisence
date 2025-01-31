class HighwayLearnerDriver {
  final String text;
  final List<List<String>> text1;

  HighwayLearnerDriver({
    required this.text,
    required this.text1,
  });

  factory HighwayLearnerDriver.fromMap(Map<String, dynamic> map) {
    return HighwayLearnerDriver(
      text: map['text'] ?? '',
      text1: List<List<String>>.from(
        map['text1']?.map((subSection) => List<String>.from(subSection)) ?? [],
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'text1': text1.map((subSection) => subSection).toList(),
    };
  }
}
