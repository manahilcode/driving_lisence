class DocumentationModelInfoModel {
  final String text;
  final String text1;
  final String text2;
  final String text3;
  final String text4;

  DocumentationModelInfoModel({
    required this.text,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
  });

  // Factory constructor to create an instance from a map (for data retrieval purposes)
  factory DocumentationModelInfoModel.fromMap(Map<String, dynamic> map) {
    return DocumentationModelInfoModel(
      text: map['text'],
      text1: map['text1'],
      text2: map['text2'],
      text3: map['text3'],
      text4: map['text4'],
    );
  }

  // Method to convert model to a map (for saving data to a database or API)
  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'text1': text1,
      'text2': text2,
      'text3': text3,
      'text4': text4,
    };
  }
}
