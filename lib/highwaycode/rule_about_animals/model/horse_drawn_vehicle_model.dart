class HorseDrawnVehiclesModel {
  final String text;
  final List<String> text1;


  HorseDrawnVehiclesModel({
    required this.text,
    required this.text1,

  });

  factory HorseDrawnVehiclesModel.fromJson(Map<String, dynamic> json) {
    return HorseDrawnVehiclesModel(
      text: json['text'] ?? '',
      text1: List<String>.from(json['text1'] ?? []),

    );
  }
}
