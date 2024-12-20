class ParkingSafely {
  final List<String> answer;
  final String correct;
  final String image;
  final String info;
  final List<String> points;
  final List<String> points1;
  final String question;
  final String subtitle;
  final String subtitle1;
  final String title;

  ParkingSafely({
  required this.answer,
  required this.correct,
  required this.image,
  required this.info,
  required this.points,
  required this.points1,
  required this.question,
  required this.subtitle,
  required this.subtitle1,
  required this.title,
});

factory ParkingSafely.fromJson(Map<String, dynamic> json) {
return ParkingSafely(
answer: List<String>.from(json['answer']),
correct: json['correct'],
image: json['image'],
info: json['info'],
points: List<String>.from(json['points']),
points1: List<String>.from(json['points1']),
question: json['question'],
subtitle: json['subtitle'],
subtitle1: json['subtitle1'],
title: json['title'],
);
}

Map<String, dynamic> toJson() {
return {

'answer': answer,
'correct': correct,
'image': image,
'info': info,
'points': points,
'points1': points1,
'question': question,
'subtitle': subtitle,
'subtitle1': subtitle1,
'title': title,
};
}
}
