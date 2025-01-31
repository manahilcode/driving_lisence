class ControlOfTheVehicle {
  final String image;
  final List<String> text;
  final List<String> text1;
  final List<String> text2;
  final List<String> text3;
  final List<String> text4;
  final List<String> text5;

  ControlOfTheVehicle({
    required this.image,
    required this.text,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.text5,
  });

  // Factory method to create an instance from Firestore map
  factory ControlOfTheVehicle.fromMap(Map<String, dynamic> map) {
    return ControlOfTheVehicle(
      image: map['image'] ?? '',
      text: List<String>.from(map['text'] ?? []),
      text1: List<String>.from(map['text1'] ?? []),
      text2: List<String>.from(map['text2'] ?? []),
      text3: List<String>.from(map['text3'] ?? []),
      text4: List<String>.from(map['text4'] ?? []),
      text5: List<String>.from(map['text5'] ?? []),
    );
  }

  // Method to serialize the model into a map
  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'text': text,
      'text1': text1,
      'text2': text2,
      'text3': text3,
      'text4': text4,
      'text5': text5,
    };
  }
}
