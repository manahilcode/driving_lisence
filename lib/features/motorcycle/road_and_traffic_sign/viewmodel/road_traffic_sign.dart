import 'package:flutter/foundation.dart';
import '../model/road_trafic_sing.dart';
import '../repo/road_traffic_sign.dart';

class RoadSignsProvider with ChangeNotifier {
  final RoadSignsRepositorySing repository;

  RoadSignsProvider({required this.repository});

  RoadSignsDataSign? _roadSignsData;
  RoadSignsDataSign? get roadSignsData => _roadSignsData;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> loadRoadSignsData(String collection, String document) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _roadSignsData = await repository.fetchRoadSignsData(collection, document);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
