import 'package:flutter/material.dart';

import '../model/towing_trailer.dart';
import '../repo/towing_trailer.dart';

class TowingTrailerNotifier extends ChangeNotifier {
  final TowingTrailerRepository repository;

  TowingTrailerModel? _towingTrailer;
  bool _isLoading = false;
  String? _errorMessage;

  TowingTrailerModel? get towingTrailer => _towingTrailer;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  TowingTrailerNotifier({required this.repository});

  Future<void> loadTowingTrailer(String documentId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _towingTrailer = await repository.fetchTowingTrailer(documentId);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
