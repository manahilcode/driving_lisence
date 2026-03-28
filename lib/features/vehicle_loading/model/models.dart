class Animal {
  final String image;
  final String subtitle;
  final String title;

  Animal({
    required this.image,
    required this.subtitle,
    required this.title,
  });

  factory Animal.fromJson(Map<String, dynamic> json) {
    return Animal(
      image: json['image'] as String,
      subtitle: json['subtitle'] as String,
      title: json['title'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'subtitle': subtitle,
      'title': title,
    };
  }
}
class IntroductionVehicleLoading {
  final String image;
  final List<String> points;
  final String title;

  IntroductionVehicleLoading({
    required this.image,
    required this.points,
    required this.title,
  });

  factory IntroductionVehicleLoading.fromJson(Map<String, dynamic> json) {
    return IntroductionVehicleLoading(
      image: json['image'] as String,
      points: List<String>.from(json['points']),
      title: json['title'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'points': points,
      'title': title,
    };
  }
}
class ThinkAboutVehicleLoading {
  final List<String> points;
  final String title;

  ThinkAboutVehicleLoading({
    required this.points,
    required this.title,
  });

  factory ThinkAboutVehicleLoading.fromJson(Map<String, dynamic> json) {
    return ThinkAboutVehicleLoading(
      points: List<String>.from(json['points']),
      title: json['title'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'points': points,
      'title': title,
    };
  }
}
class VehicleKeepStable {
  final String image;
  final List<String> points;
  final String subtitle;
  final String subtitle2;
  final List<String> tip;
  final String title;

  VehicleKeepStable({
    required this.image,
    required this.points,
    required this.subtitle,
    required this.subtitle2,
    required this.tip,
    required this.title,
  });

  factory VehicleKeepStable.fromJson(Map<String, dynamic> json) {
    return VehicleKeepStable(
      image: json['image'] as String,
      points: List<String>.from(json['points']),
      subtitle: json['subtitle'] as String,
      subtitle2: json['subtitle2'] as String,
      tip: List<String>.from(json['tip']),
      title: json['title'] as String,
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
class MeetingStandardVehicleLoading {
  final List<String> points;
  final List<String> points2;
  final String title;
  final String title2;
  final String title3;

  MeetingStandardVehicleLoading({
    required this.points,
    required this.points2,
    required this.title,
    required this.title2,
    required this.title3,
  });

  factory MeetingStandardVehicleLoading.fromJson(Map<String, dynamic> json) {
    return MeetingStandardVehicleLoading(
      points: List<String>.from(json['points']),
      points2: List<String>.from(json['points2']),
      title: json['title'] as String,
      title2: json['title2'] as String,
      title3: json['title3'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'points': points,
      'points2': points2,
      'title': title,
      'title2': title2,
      'title3': title3,
    };
  }
}
class PassengerVehicleLoader {
  final String image1;
  final String image2;
  final String imageCaption1;
  final String imageCaption2;
  final String subtitle;
  final String subtitle2;
  final String title;

  PassengerVehicleLoader({
    required this.image1,
    required this.image2,
    required this.imageCaption1,
    required this.imageCaption2,
    required this.subtitle,
    required this.subtitle2,
    required this.title,
  });

  factory PassengerVehicleLoader.fromJson(Map<String, dynamic> json) {
    return PassengerVehicleLoader(
      image1: json['image1'] as String,
      image2: json['image2'] as String,
      imageCaption1: json['image_caption1'] as String,
      imageCaption2: json['image_caption2'] as String,
      subtitle: json['subtitle'] as String,
      subtitle2: json['subtitle2'] as String,
      title: json['title'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image1': image1,
      'image2': image2,
      'image_caption1': imageCaption1,
      'image_caption2': imageCaption2,
      'subtitle': subtitle,
      'subtitle2': subtitle2,
      'title': title,
    };
  }
}
class SavingFuelVehicleLoading {
  final String image;
  final String subtitle;
  final String title;

  SavingFuelVehicleLoading({
    required this.image,
    required this.subtitle,
    required this.title,
  });

  factory SavingFuelVehicleLoading.fromJson(Map<String, dynamic> json) {
    return SavingFuelVehicleLoading(
      image: json['image'] as String,
      subtitle: json['subtitle'] as String,
      title: json['title'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'subtitle': subtitle,
      'title': title,
    };
  }
}
class DiscussWithInstructorVehicleLoading {
  final List<String> points;
  final List<String> points2;
  final String subtitle;
  final String title;
  final String title2;
  final String title3;

  DiscussWithInstructorVehicleLoading({
    required this.points,
    required this.points2,
    required this.subtitle,
    required this.title,
    required this.title2,
    required this.title3,
  });

  factory DiscussWithInstructorVehicleLoading.fromJson(Map<String, dynamic> json) {
    return DiscussWithInstructorVehicleLoading(
      points: List<String>.from(json['points']),
      points2: List<String>.from(json['points2']),
      subtitle: json['subtitle'] as String,
      title: json['title'] as String,
      title2: json['title2'] as String,
      title3: json['title3'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'points': points,
      'points2': points2,
      'subtitle': subtitle,
      'title': title,
      'title2': title2,
      'title3': title3,
    };
  }
}
class TowingVehicleLoading {
  final Map<String, String>? answers;
  final String question;
  final String correct;
  final String image;
  final String image1;
  final String image2;
  final String imageCaption1;
  final String imageCaption2;
  final String subtitle1;
  final String subtitle2;
  final String subtitle3;
  final List tips;
  final String title;

  TowingVehicleLoading({
    required this.answers,
    required this.question,
    required this.correct,
    required this.image,
    required this.image1,
    required this.image2,
    required this.imageCaption1,
    required this.imageCaption2,
    required this.subtitle1,
    required this.subtitle2,
    required this.subtitle3,
    required this.tips,
    required this.title,
  });

  factory TowingVehicleLoading.fromJson(Map<String, dynamic> json) {
    return TowingVehicleLoading(
      answers: (json['Answers'] as Map<String, dynamic>?)?.map(
            (key, value) => MapEntry(key, value as String),
      ),
      question: json['Question'] as String,
      correct: json['correct'] as String,
      image: json['image'] as String,
      image1: json['image1'] as String,
      image2: json['image2'] as String,
      imageCaption1: json['image_caption1'] as String,
      imageCaption2: json['image_caption2'] as String,
      subtitle1: json['subtitle1'] as String,
      subtitle2: json['subtitle2'] as String,
      subtitle3: json['subtitle3'] as String,
      tips: (json['tip '] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
      title: json['title'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Answers': answers,
      'Question': question,
      'correct': correct,
      'image': image,
      'image1': image1,
      'image2': image2,
      'image_caption1': imageCaption1,
      'image_caption2': imageCaption2,
      'subtitle1': subtitle1,
      'subtitle2': subtitle2,
      'subtitle3': subtitle3,
      'tip': tips,
      'title': title,
    };
  }
}
