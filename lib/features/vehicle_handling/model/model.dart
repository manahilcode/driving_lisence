class IntroductionModel {
  final String imageUrl;
  final List<String> points;
  final String title;

  IntroductionModel({
    required this.imageUrl,
    required this.points,
    required this.title,
  });

  // Convert Firestore data to ImageModel
  factory IntroductionModel.fromMap(Map<String, dynamic> data) {
    return IntroductionModel(
      imageUrl: data['Image'] ?? '',
      points: List<String>.from(data['points'] ?? []),
      title: data['title'] ?? '',
    );
  }
}


class WeatherCondition {
  final String question;
  final Map answers;
  final String correctAnswer;
  final String imageUrl;
  final List<String> points;
  final String? subtitle;    // Nullable
  final String? subtitle2;   // Nullable
  final String? subtitle3;   // Nullable
  final String title;
  final String title2;

  WeatherCondition({
    required this.question,
    required this.answers,
    required this.correctAnswer,
    required this.imageUrl,
    required this.points,
    this.subtitle,    // Optional parameter
    this.subtitle2,   // Optional parameter
    this.subtitle3,   // Optional parameter
    required this.title,
    required this.title2,
  });

  factory WeatherCondition.fromFirestore(Map<String, dynamic> data) {
    return WeatherCondition(
      question: data['Question'] as String? ?? '', // Provide a default value if null
      answers: Map<String, String>.from(data['Answers'] as Map<dynamic, dynamic>? ?? {}),
      correctAnswer: data['correct'] as String? ?? '', // Provide a default value if null
      imageUrl: data['image'] as String? ?? '', // Provide a default value if null
      points: List<String>.from(data['points'] as List<dynamic>? ?? []), // Provide a default empty list if null
      subtitle: data['subtitle'] as String?, // Nullable
      subtitle2: data['subtilte2'] as String?, // Nullable
      subtitle3: data['subtitle3'] as String?, // Nullable
      title: data['title'] as String? ?? '', // Provide a default value if null
      title2: data['title2'] as String? ?? '', // Provide a default value if null
    );
  }
}



class FogModel {
  final Map  answers;
  final String question;
  final String correctAnswer;
  final String image;
  final List<String> points;
  final List<String> points2;
  final String subtitle;
  final String subtitle2;
  final String tip;
  final String title;

  FogModel({
    required this.answers,
    required this.question,
    required this.correctAnswer,
    required this.image,
    required this.points,
    required this.points2,
    required this.subtitle,
    required this.subtitle2,
    required this.tip,
    required this.title,
  });

  // Factory method to create an instance from a map
  factory FogModel.fromMap(Map<String, dynamic> map) {
    return FogModel(
      answers: Map<String, String>.from(map['Answers'] as Map<dynamic, dynamic>? ?? {}),
      question: map['Question'] ?? '', // Default to an empty string if null
      correctAnswer: map['correct'] ?? '', // Default to an empty string if null
      image: map['image'] ?? '', // Default to an empty string if null
      points: List<String>.from(map['points'] ?? []), // Default to an empty list if null
      points2: List<String>.from(map['points2'] ?? []), // Default to an empty list if null
      subtitle: map['subtitle'] ?? '', // Default to an empty string if null
      subtitle2: map['subtitle2'] ?? '', // Default to an empty string if null
      tip: map['tip '] ?? '', // Default to an empty string if null
      title: map['title'] ?? '', // Default to an empty string if null
    );
  }
}

class VeryBadWeatherModel {
  final String image;
  final List<String> points;
  final String subtitle;
  final String subtitle2;
  final String tip;
  final String title;

  VeryBadWeatherModel({
    required this.image,
    required this.points,
    required this.subtitle,
    required this.subtitle2,
    required this.tip,
    required this.title,
  });

  factory VeryBadWeatherModel.fromJson(Map<String, dynamic> json) {
    return VeryBadWeatherModel(
      image: json['image'] as String? ?? '',
      points: List<String>.from(json['points'] as List<dynamic>? ?? []),
      subtitle: json['subtitle'] as String? ?? '',
      subtitle2: json['subtitle2'] as String? ?? '',
      tip: json['tip'] as String? ?? '',
      title: json['title'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'points': points,
      'subtitle': subtitle,
      'subtitle2': subtitle2,
      'tip': tip,
      'title': title,
    };
  }
}

class WindyModel {
  final String image;
  final List<String> points;
  final String subtitle;
  final String title;

  WindyModel({
    required this.image,
    required this.points,
    required this.subtitle,
    required this.title,
  });

  factory WindyModel.fromFirestore(Map<String, dynamic> json) {
    return WindyModel(
      image: json['image'] as String? ?? '',
      points: List<String>.from(json['points'] as List<dynamic>? ?? []),
      subtitle: json['subtitle'] as String? ?? '',
      title: json['title'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'points': points,
      'subtitle': subtitle,
      'title': title,
    };
  }
}

class DrivingNightModel {
  final String image;
  final List<String> points;
  final String subtitle;
  final String subtitle2;
  final String tip;
  final String title;

  DrivingNightModel({
    required this.image,
    required this.points,
    required this.subtitle,
    required this.subtitle2,
    required this.tip,
    required this.title,
  });

  factory DrivingNightModel.fromFirestore(Map<String, dynamic> json) {
    return DrivingNightModel(
      image: json['image'] as String? ?? '',
      points: List<String>.from(json['points'] as List<dynamic>? ?? []),
      subtitle: json['subtitle'] as String? ?? '',
      subtitle2: json['subtitle2'] as String? ?? '',
      tip: json['tip'] as String? ?? '',
      title: json['title'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'points': points,
      'subtitle': subtitle,
      'subtitle2': subtitle2,
      'tip': tip,
      'title': title,
    };
  }
}

class KeepControlVehicleModel {
  final List<String> points1;
  final List<String> points2;
  final String subtitle1;
  final String subtitle2;
  final String subtitle3;
  final String title;

  KeepControlVehicleModel({
    required this.points1,
    required this.points2,
    required this.subtitle1,
    required this.subtitle2,
    required this.subtitle3,
    required this.title,
  });

  factory KeepControlVehicleModel.fromFirestore(Map<String, dynamic> json) {
    return KeepControlVehicleModel(
      points1: List<String>.from(json['points1'] as List<dynamic>? ?? []),
      points2: List<String>.from(json['points2'] as List<dynamic>? ?? []),
      subtitle1: json['subtitle1'] as String? ?? '',
      subtitle2: json['subtitle2'] as String? ?? '',
      subtitle3: json['subtitle3'] as String? ?? '',
      title: json['title'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'points1': points1,
      'points2': points2,
      'subtitle1': subtitle1,
      'subtitle2': subtitle2,
      'subtitle3': subtitle3,
      'title': title,
    };
  }
}

class TrafficCalmingAndRoadSurfaces {
  final String image1;
  final String image2;
  final String subtitle1;
  final String subtitle2;
  final String subtitle3;
  final String tip;
  final String title;

  // Constructor
  TrafficCalmingAndRoadSurfaces({
    required this.image1,
    required this.image2,
    required this.subtitle1,
    required this.subtitle2,
    required this.subtitle3,
    required this.tip,
    required this.title,
  });

  // Factory method to create a model instance from Firestore data
  factory TrafficCalmingAndRoadSurfaces.fromFirestore(Map<String, dynamic> data) {
    return TrafficCalmingAndRoadSurfaces(
      image1: data['image1'] ?? '',
      image2: data['image2'] ?? '',
      subtitle1: data['subtitle1'] ?? '',
      subtitle2: data['subtitle2'] ?? '',
      subtitle3: data['subtitle3'] ?? '',
      tip: data['tip'] ?? '',
      title: data['title'] ?? '',
    );
  }

  // Method to convert the model to a Map, for sending back to Firestore
  Map<String, dynamic> toMap() {
    return {
      'image1': image1,
      'image2': image2,
      'subtitle1': subtitle1,
      'subtitle2': subtitle2,
      'subtitle3': subtitle3,
      'tip': tip,
      'title': title,
    };
  }
}

class MeetingStandard {
  final List<String> points1;
  final List<String> points2;
  final String title;

  // Constructor
  MeetingStandard({
    required this.points1,
    required this.points2,
    required this.title,
  });

  // Factory method to create a model instance from Firestore data
  factory MeetingStandard.fromFirestore(Map<String, dynamic> data) {
    return MeetingStandard(
      points1: List<String>.from(data['points1'] ?? []),
      points2: List<String>.from(data['points2'] ?? []),
      title: data['title'] ?? '',
    );
  }

  // Method to convert the model to a Map, for sending back to Firestore
  Map<String, dynamic> toMap() {
    return {
      'points1': points1,
      'points2': points2,
      'title': title,
    };
  }
}

class ThinkAbout {
  final List<String> points;
  final String title;

  // Constructor
  ThinkAbout({
    required this.points,
    required this.title,
  });

  // Factory method to create a model instance from Firestore data
  factory ThinkAbout.fromFirestore(Map<String, dynamic> data) {
    return ThinkAbout(
      points: List<String>.from(data['points'] ?? []),
      title: data['title'] ?? '',
    );
  }

  // Method to convert the model to a Map, for sending back to Firestore
  Map<String, dynamic> toMap() {
    return {
      'points': points,
      'title': title,
    };
  }
}

class PracticeWithInstructor {
  final List<String> points1;
  final List<String> points2;
  final String subtitle;
  final String title;
  final String title2;
  final String title3;

  // Constructor
  PracticeWithInstructor({
    required this.points1,
    required this.points2,
    required this.subtitle,
    required this.title,
    required this.title2,
    required this.title3,
  });

  // Factory method to create a model instance from Firestore data
  factory PracticeWithInstructor.fromFirestore(Map<String, dynamic> data) {
    return PracticeWithInstructor(
      points1: List<String>.from(data['points1'] ?? []),
      points2: List<String>.from(data['points2'] ?? []),
      subtitle: data['subtitle'] ?? '',
      title: data['title'] ?? '',
      title2: data['title2'] ?? '',
      title3: data['title3'] ?? '',
    );
  }

  // Method to convert the model to a Map, for sending back to Firestore
  Map<String, dynamic> toMap() {
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













