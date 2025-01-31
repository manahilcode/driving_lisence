class ActsAndRegulationsPriorTo1988 {
  final String text;

  ActsAndRegulationsPriorTo1988({
    required this.text,
  });

  factory ActsAndRegulationsPriorTo1988.fromFirestore(Map<String, dynamic> data) {
    return ActsAndRegulationsPriorTo1988(
      text: data['text'] ?? '',
    );
  }
}
