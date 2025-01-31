class VehicleTowingAndLoadingModel {
  final String header;
  final List<String> breakdowns;
  final List<String> points;

  VehicleTowingAndLoadingModel({
    required this.header,
    required this.breakdowns,
    required this.points,
  });

  factory VehicleTowingAndLoadingModel.fromJson(Map<String, dynamic> json) {
    return VehicleTowingAndLoadingModel(
      header: json['header'] ?? '',
      breakdowns: List<String>.from(json['breakdowns'] ?? []),
      points: List<String>.from(json['points'] ?? []),
    );
  }
}
