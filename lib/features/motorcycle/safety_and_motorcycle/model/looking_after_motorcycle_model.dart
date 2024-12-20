class MotorcycleMaintenance {
  final String fuel;
  final String image;
  final List<String> points;
  final String subtitle;
  final List<Tip> tip;
  final String title;

  MotorcycleMaintenance({
    required this.fuel,
    required this.image,
    required this.points,
    required this.subtitle,
    required this.tip,
    required this.title,
  });

  factory MotorcycleMaintenance.fromJson(Map<String, dynamic> json) {
    var list = json['tip'] as List;
    List<Tip> tipList = list.map((i) => Tip.fromJson(i)).toList();

    return MotorcycleMaintenance(
      fuel: json['fuel'],
      image: json['image'],
      points: List<String>.from(json['points']),
      subtitle: json['subtitle'],
      tip: tipList,
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fuel': fuel,
      'image': image,
      'points': points,
      'subtitle': subtitle,
      'tip': tip.map((i) => i.toJson()).toList(),
      'title': title,
    };
  }
}

class Tip {
  final String image;
  final String subtitle;
  final String title;

  Tip({
    required this.image,
    required this.subtitle,
    required this.title,
  });

  factory Tip.fromJson(Map<String, dynamic> json) {
    return Tip(
      image: json['image'],
      subtitle: json['subtitle'],
      title: json['title'],
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
