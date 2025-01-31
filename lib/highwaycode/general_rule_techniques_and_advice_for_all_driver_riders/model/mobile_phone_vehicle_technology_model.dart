class MobilePhonesAndInVehicleTechnology {
  final String image;
  final String text;
  final String text1;
  final String text2;
  final String text3;
  final List<String> text4;

  MobilePhonesAndInVehicleTechnology({
    required this.image,
    required this.text,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
  });

  // Factory constructor to create an instance from a Firestore document
  factory MobilePhonesAndInVehicleTechnology.fromFirestore(Map<String, dynamic> doc) {
    return MobilePhonesAndInVehicleTechnology(
      image: doc['image'] ?? '',
      text: doc['text'] ?? '',
      text1: doc['text1'] ?? '',
      text2: doc['text2'] ?? '',
      text3: doc['text3'] ?? '',
      text4: List<String>.from(doc['text4'] ?? []),
    );
  }

  // Convert the instance to a map (for saving to Firestore)
  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'text': text,
      'text1': text1,
      'text2': text2,
      'text3': text3,
      'text4': text4,
    };
  }
}
