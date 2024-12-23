import 'package:flutter/material.dart';

import '../model/safety_in_tunnel.dart';
import '../repo/safety_in_tunnel.dart';

class TunnelSafetyNotifier extends ChangeNotifier {
  final TunnelSafetyRepository repository;

  TunnelSafetyModel? _tunnelSafety;
  bool _isLoading = false;
  String? _errorMessage;

  TunnelSafetyModel? get tunnelSafety => _tunnelSafety;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  TunnelSafetyNotifier({required this.repository});

  Future<void> loadTunnelSafety(String documentId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _tunnelSafety = await repository.fetchTunnelSafety(documentId);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
