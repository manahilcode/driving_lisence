class ObstructionsModel {
  final String text;

  ObstructionsModel({
    required this.text,
  });

  factory ObstructionsModel.fromMap(Map<String, dynamic> map) {
    return ObstructionsModel(
      text: map['text'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
    };
  }
}



