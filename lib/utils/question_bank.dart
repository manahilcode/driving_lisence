class Question {
  final String text;
  final List<String> options;
  final int correctIndex;

  const Question({
    required this.text,
    required this.options,
    required this.correctIndex,
  });
}

class QuestionBank {
  /// Keep data local so the app works fully offline.
  static const sampleQuestions = <Question>[
    Question(
      text: 'What does a red traffic light mean?',
      options: ['Go', 'Stop', 'Speed up', 'Sound horn'],
      correctIndex: 1,
    ),
    Question(
      text: 'When should you use your seat belt?',
      options: ['Only on highways', 'Only at night', 'Always', 'Never'],
      correctIndex: 2,
    ),
    Question(
      text: 'What is the safe action near a pedestrian crossing?',
      options: [
        'Maintain speed',
        'Be ready to slow/stop',
        'Overtake other cars',
        'Use high beam'
      ],
      correctIndex: 1,
    ),
  ];
}

