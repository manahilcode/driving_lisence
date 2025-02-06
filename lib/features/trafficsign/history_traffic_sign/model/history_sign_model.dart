class TrafficSignHistory {
  final String image;
  final String image1;
  final String image2;
  final String image3;
  final String image4;
  final String image5;
  final String image6;
  final String image7;
  final String text;
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final String text5;
  final String text6;
  final String text7;
  final String text8;

  TrafficSignHistory({
    required this.image,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
    required this.image5,
    required this.image6,
    required this.image7,
    required this.text,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.text5,
    required this.text6,
    required this.text7,
    required this.text8,
  });

  factory TrafficSignHistory.fromMap(Map<String, dynamic> data) {
    return TrafficSignHistory(
      image: data['image'] ?? '',
      image1: data['image1'] ?? '',
      image2: data['image2'] ?? '',
      image3: data['image3'] ?? '',
      image4: data['image4'] ?? '',
      image5: data['image5'] ?? '',
      image6: data['image6'] ?? '',
      image7: data['image7'] ?? '',
      text: data['text'] ?? '',
      text1: data['text1'] ?? '',
      text2: data['text2'] ?? '',
      text3: data['text3'] ?? '',
      text4: data['text4'] ?? '',
      text5: data['text5'] ?? '',
      text6: data['text6'] ?? '',
      text7: data['text7'] ?? '',
      text8: data['text8'] ?? '',
    );
  }
}