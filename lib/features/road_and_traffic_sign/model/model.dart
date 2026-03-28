class IntroductionRoadsign {
  final String? image;
  final List<String>? points;
  final String? title;

  IntroductionRoadsign({
    required this.image,
    required this.points,
    required this.title,
  });

  // Factory method to create an instance from Firebase data
  factory IntroductionRoadsign.fromJson(Map<String, dynamic> json) {
    return IntroductionRoadsign(
      image: json['image'] as String?,
      points: (json['points'] as List<dynamic>?)
          ?.map((point) => point as String)
          .toList(),
      title: json['title'] as String?,
    );
  }

  // Method to convert an instance back to JSON
  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'points': points,
      'title': title,
    };
  }
}

class SignRoadSign {
  final String? image1;
  final String? image2;
  final String? image3;
  final String? image4;
  final String? image5;
  final String? image6;
  final String? image7;
  final String? image8;
  final String? image9;
  final String? imageCaption1;
  final String? imageCaption2;
  final String? imageCaption3;
  final String? imageCaption4;
  final String? imageCaption5;
  final String? imageCaption6;
  final String? imageCaption7;
  final String? imageCaption8;
  final String? imageCaption9;
  final String? subtitle1;
  final String? subtitle2;
  final String? title;

  SignRoadSign({
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
    required this.image5,
    required this.image6,
    required this.image7,
    required this.image8,
    required this.image9,
    required this.imageCaption1,
    required this.imageCaption2,
    required this.imageCaption3,
    required this.imageCaption4,
    required this.imageCaption5,
    required this.imageCaption6,
    required this.imageCaption7,
    required this.imageCaption8,
    required this.imageCaption9,
    required this.subtitle1,
    required this.subtitle2,
    required this.title,
  });

  // Factory method to create an instance from Firebase data
  factory SignRoadSign.fromJson(Map<String, dynamic> json) {
    return SignRoadSign(
      image1: json['image1'] as String?,
      image2: json['image2'] as String?,
      image3: json['image3'] as String?,
      image4: json['image4'] as String?,
      image5: json['image5'] as String?,
      image6: json['image6'] as String?,
      image7: json['image7'] as String?,
      image8: json['image8'] as String?,
      image9: json['image9'] as String?,
      imageCaption1: json['image_caption1'] as String?,
      imageCaption2: json['image_caption2'] as String?,
      imageCaption3: json['image_caption3'] as String?,
      imageCaption4: json['image_caption4'] as String?,
      imageCaption5: json['image_caption5'] as String?,
      imageCaption6: json['image_caption6'] as String?,
      imageCaption7: json['image_caption7'] as String?,
      imageCaption8: json['image_caption8'] as String?,
      imageCaption9: json['image_caption9'] as String?,
      subtitle1: json['subtitle1'] as String?,
      subtitle2: json['subtitle2'] as String?,
      title: json['title'] as String?,
    );
  }

  // Method to convert an instance back to JSON
  Map<String, dynamic> toJson() {
    return {
      'image1': image1,
      'image2': image2,
      'image3': image3,
      'image4': image4,
      'image5': image5,
      'image6': image6,
      'image7': image7,
      'image8': image8,
      'image9': image9,
      'image_caption1': imageCaption1,
      'image_caption2': imageCaption2,
      'image_caption3': imageCaption3,
      'image_caption4': imageCaption4,
      'image_caption5': imageCaption5,
      'image_caption6': imageCaption6,
      'image_caption7': imageCaption7,
      'image_caption8': imageCaption8,
      'image_caption9': imageCaption9,
      'subtitle1': subtitle1,
      'subtitle2': subtitle2,
      'title': title,
    };
  }
}

class DiscussInstructorRoadSign {
  final List<String>? points1;
  final List<String>? points2;
  final String? subtitle;
  final String? title;
  final String? title2;
  final String? title3;

  DiscussInstructorRoadSign({
    required this.points1,
    required this.points2,
    required this.subtitle,
    required this.title,
    required this.title2,
    required this.title3,
  });

  // Factory method to create an instance from Firebase data
  factory DiscussInstructorRoadSign.fromJson(Map<String, dynamic> json) {
    return DiscussInstructorRoadSign(
      points1: List<String>.from(json['points1'] ?? []),
      points2: List<String>.from(json['points2'] ?? []),
      subtitle: json['subtitle'] as String?,
      title: json['title'] as String?,
      title2: json['title2'] as String?,
      title3: json['title3'] as String?,
    );
  }

  // Method to convert an instance back to JSON
  Map<String, dynamic> toJson() {
    return {
      'points1': points1,
      'points2': points2,
      'subtitle': subtitle,
      'title': title,
      'title2': title2,
      'title3': title3,
    };
  }
}

class MeetingStandardRoadSign {
  final List<String>? points1;
  final List<String>? points2;
  final String? title;
  final String? title2;
  final String? title3;

  MeetingStandardRoadSign({
    required this.points1,
    required this.points2,
    required this.title,
    required this.title2,
    required this.title3,
  });

  // Factory method to create an instance from Firebase data
  factory MeetingStandardRoadSign.fromJson(Map<String, dynamic> json) {
    return MeetingStandardRoadSign(
      points1: List<String>.from(json['points1'] ?? []),
      points2: List<String>.from(json['points2'] ?? []),
      title: json['title'] as String?,
      title2: json['title2'] as String?,
      title3: json['title3'] as String?,
    );
  }

  // Method to convert an instance back to JSON
  Map<String, dynamic> toJson() {
    return {
      'points1': points1,
      'points2': points2,
      'title': title,
      'title2': title2,
      'title3': title3,
    };
  }
}

class RoadLaneRoadSign {
  final String? image1;
  final String? image2;
  final List<String>? points;
  final String? subtitle;
  final String? subtitle2;
  final String? title;

  RoadLaneRoadSign({
    required this.image1,
    required this.image2,
    required this.points,
    required this.subtitle,
    required this.subtitle2,
    required this.title,
  });

  // Factory method to create an instance from Firebase data
  factory RoadLaneRoadSign.fromJson(Map<String, dynamic> json) {
    return RoadLaneRoadSign(
      image1: json['image1'] as String?,
      image2: json['image2'] as String?,
      points: List<String>.from(json['points'] ?? []),
      subtitle: json['subtitle'] as String?,
      subtitle2: json['subtitle2'] as String?,
      title: json['title'] as String?,
    );
  }

  // Method to convert an instance back to JSON
  Map<String, dynamic> toJson() {
    return {
      'image1': image1,
      'image2': image2,
      'points': points,
      'subtitle': subtitle,
      'subtitle2': subtitle2,
      'title': title,
    };
  }
}

class RoadMarkingRoadSign {
  final String? image1;
  final String? image10;
  final String? image11;
  final String? image2;
  final String? image3;
  final String? image4;
  final String? image5;
  final String? image6;
  final String? image7;
  final String? image8;
  final String? image9;
  final String? imageCaption1;
  final String? imageCaption10;
  final String? imageCaption2;
  final List<String>? imageCaption3;
  final String? imageCaption4;
  final String? imageCaption5;
  final String? imageCaption6;
  final String? imageCaption7;
  final String? imageCaption8;
  final String? imageCaption9;
  final String? subtitle1;
  final String? subtitle2;
  final String? subtitle3;
  final String? title;
  final String? title2;

  RoadMarkingRoadSign({
    required this.image1,
    required this.image10,
    required this.image11,
    required this.image2,
    required this.image3,
    required this.image4,
    required this.image5,
    required this.image6,
    required this.image7,
    required this.image8,
    required this.image9,
    required this.imageCaption1,
    required this.imageCaption10,
    required this.imageCaption2,
    required this.imageCaption3,
    required this.imageCaption4,
    required this.imageCaption5,
    required this.imageCaption6,
    required this.imageCaption7,
    required this.imageCaption8,
    required this.imageCaption9,
    required this.subtitle1,
    required this.subtitle2,
    required this.subtitle3,
    required this.title,
    required this.title2,
  });

  // Factory method to create an instance from Firebase data
  factory RoadMarkingRoadSign.fromJson(Map<String, dynamic> json) {
    return RoadMarkingRoadSign(
      image1: json['image1'] as String?,
      image10: json['image10'] as String?,
      image11: json['image11'] as String?,
      image2: json['image2'] as String?,
      image3: json['image3'] as String?,
      image4: json['image4'] as String?,
      image5: json['image5'] as String?,
      image6: json['image6'] as String?,
      image7: json['image7'] as String?,
      image8: json['image8'] as String?,
      image9: json['image9'] as String?,
      imageCaption1: json['image_caption1'] as String?,
      imageCaption10: json['image_caption10'] as String?,
      imageCaption2: json['image_caption2'] as String?,
      imageCaption3: List<String>.from(json['image_caption3'] ?? []),
      imageCaption4: json['image_caption4'] as String?,
      imageCaption5: json['image_caption5'] as String?,
      imageCaption6: json['image_caption6'] as String?,
      imageCaption7: json['image_caption7'] as String?,
      imageCaption8: json['image_caption8'] as String?,
      imageCaption9: json['image_caption9'] as String?,
      subtitle1: json['subtitle1'] as String?,
      subtitle2: json['subtitle2'] as String?,
      subtitle3: json['subtitle3'] as String?,
      title: json['title'] as String?,
      title2: json['title2'] as String?,
    );
  }

  // Method to convert an instance back to JSON
  Map<String, dynamic> toJson() {
    return {
      'image1': image1,
      'image10': image10,
      'image11': image11,
      'image2': image2,
      'image3': image3,
      'image4': image4,
      'image5': image5,
      'image6': image6,
      'image7': image7,
      'image8': image8,
      'image9': image9,
      'image_caption1': imageCaption1,
      'image_caption10': imageCaption10,
      'image_caption2': imageCaption2,
      'image_caption3': imageCaption3,
      'image_caption4': imageCaption4,
      'image_caption5': imageCaption5,
      'image_caption6': imageCaption6,
      'image_caption7': imageCaption7,
      'image_caption8': imageCaption8,
      'image_caption9': imageCaption9,
      'subtitle1': subtitle1,
      'subtitle2': subtitle2,
      'subtitle3': subtitle3,
      'title': title,
      'title2': title2,
    };
  }
}

class DriverSignal {
  final String showingGivingWay;
  final String aboutToTurn;
  final String rightOfWay;
  final String lettingThemKnow;
  final String question;
  final String correctAnswer;
  final String image1;
  final String image2;
  final String image3;
  final String subtitle;
  final String subtitle2;
  final String subtitle3;
  final String subtitle4;
  final String subtitle5;
  final String tip;
  final String title;
  final Map<String, String>? answers;


  DriverSignal({
    required this.showingGivingWay,
    required this.aboutToTurn,
    required this.rightOfWay,
    required this.lettingThemKnow,
    required this.question,
    required this.correctAnswer,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.subtitle,
    required this.subtitle2,
    required this.subtitle3,
    required this.subtitle4,
    required this.subtitle5,
    required this.tip,
    required this.title,
    required this.answers
  });

  factory DriverSignal.fromJson(Map<String, dynamic> json) {
    return DriverSignal(
      showingGivingWay: json['showingGivingWay'] ?? '',
      answers: (json['Answers'] as Map<String, dynamic>?)?.map(
            (key, value) => MapEntry(key, value as String),
      ),
      aboutToTurn: json['aboutToTurn'] ?? '',
      rightOfWay: json['rightOfWay'] ?? '',
      lettingThemKnow: json['lettingThemKnow'] ?? '',
      question: json['Question'] ?? '',
      correctAnswer: json['correct'] ?? '',
      image1: json['image1'] ?? '',
      image2: json['image2'] ?? '',
      image3: json['image3'] ?? '',
      subtitle: json['subtitle'] ?? '',
      subtitle2: json['subtitle2'] ?? '',
      subtitle3: json['subtitle3'] ?? '',
      subtitle4: json['subtitle4'] ?? '',
      subtitle5: json['subtitle5'] ?? '',
      tip: json['tip'] ?? '',
      title: json['title'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'showingGivingWay': showingGivingWay,
      'aboutToTurn': aboutToTurn,
      'rightOfWay': rightOfWay,
      'lettingThemKnow': lettingThemKnow,
      'question': question,
      'correctAnswer': correctAnswer,
      'image1': image1,
      'image2': image2,
      'image3': image3,
      'subtitle': subtitle,
      'subtitle2': subtitle2,
      'subtitle3': subtitle3,
      'subtitle4': subtitle4,
      'subtitle5': subtitle5,
      'tip': tip,
      'title': title,
    };
  }
}

class ThinkAboutRoadSign {
  final String title;
  final List<String> points;

  ThinkAboutRoadSign({required this.title, required this.points});

  // Factory method to create an instance from a Map
  factory ThinkAboutRoadSign.fromMap(Map<String, dynamic> data) {
    return ThinkAboutRoadSign(
      title: data['title'] ?? '',
      points: List<String>.from(data['points'] ?? []),
    );
  }

  // Method to convert the instance back to a Map
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'points': points,
    };
  }
}

class TrafficLightAndWarning {
  final String title;
  final List<String> points;

  // Individual image fields
  final String image1;
  final String image2;
  final String image3;
  final String image4;
  final String image5;

  // Individual image caption fields
  final String imageCaption3;
  final String imageCaption4;
  final String imageCaption5;

  // Individual subtitle fields
  final String subtitle1;
  final String subtitle2;
  final String subtitle3;
  final String subtitle4;
  final String subtitle5;
  final String subtitle6;

  TrafficLightAndWarning({
    required this.title,
    required this.points,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
    required this.image5,
    required this.imageCaption3,
    required this.imageCaption4,
    required this.imageCaption5,
    required this.subtitle1,
    required this.subtitle2,
    required this.subtitle3,
    required this.subtitle4,
    required this.subtitle5,
    required this.subtitle6,
  });

  // Factory method to create an instance from a Map
  factory TrafficLightAndWarning.fromMap(Map<String, dynamic> data) {
    return TrafficLightAndWarning(
      title: data['title'] ?? '',
      points: List<String>.from(data['points'] ?? []),
      image1: data['image'] ?? '',
      image2: data['image2'] ?? '',
      image3: data['image3'] ?? '',
      image4: data['image4'] ?? '',
      image5: data['image5'] ?? '',
      imageCaption3: data['image_caption3'] ?? '',
      imageCaption4: data['image_caption4'] ?? '',
      imageCaption5: data['image_caption5'] ?? '',
      subtitle1: data['subtitle1'] ?? '',
      subtitle2: data['subtitle2'] ?? '',
      subtitle3: data['subtitle3'] ?? '',
      subtitle4: data['subtitle4'] ?? '',
      subtitle5: data['subtitle5'] ?? '',
      subtitle6: data['subtitle6'] ?? '',
    );
  }

  // Method to convert the instance back to a Map
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'points': points,
      'image1': image1,
      'image2': image2,
      'image3': image3,
      'image4': image4,
      'image5': image5,
      'image_caption3': imageCaption3,
      'image_caption4': imageCaption4,
      'image_caption5': imageCaption5,
      'subtitle1': subtitle1,
      'subtitle2': subtitle2,
      'subtitle3': subtitle3,
      'subtitle4': subtitle4,
      'subtitle5': subtitle5,
      'subtitle6': subtitle6,
    };
  }
}
