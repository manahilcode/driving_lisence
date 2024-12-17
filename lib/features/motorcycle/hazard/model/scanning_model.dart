class ScanningModel {
  final List<String> answers;
  final String correct;
  final String correct1;
  final String image1;
  final String image2;
  final String image3;
  final List<String> points;
  final String question;
  final String question1;
  final String subtitle;
  final String subtitle1;
  final String subtitle2;
  final String text;
  final String title;
  final String video;
  final String video2;
  final String info;

  ScanningModel({
    required this.answers,
    required this.correct,
    required this.correct1,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.points,
    required this.question,
    required this.question1,
    required this.subtitle,
    required this.subtitle1,
    required this.subtitle2,
    required this.text,
    required this.title,
    required this.video,
    required this.video2,
    required this.info,
  });

  factory ScanningModel.fromJson(Map<String, dynamic> json) {
    return ScanningModel(
      answers: List<String>.from(json['answers']),
      correct: json['correct'],
      correct1: json['correct1'],
      image1: json['image1'],
      image2: json['image2'],
      image3: json['image3'],
      points: List<String>.from(json['points']),
      question: json['question'],
      question1: json['question1'],
      subtitle: json['subtitle'],
      subtitle1: json['subtitle1'],
      subtitle2: json['subtitle2'],
      text: json['text'],
      title: json['title'],
      video: json['video'],
      video2: json['video2'],
      info: json['info']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'answers': answers,
      'correct': correct,
      'correct1': correct1,
      'image1': image1,
      'image2': image2,
      'image3': image3,
      'points': points,
      'question': question,
      'question1': question1,
      'subtitle': subtitle,
      'subtitle1': subtitle1,
      'subtitle2': subtitle2,
      'text': text,
      'title': title,
      'video': video,
      'video2': video2,
    };
  }
}
