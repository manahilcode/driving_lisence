// Provider for managing state
import 'package:flutter/foundation.dart';

import '../model/signal_given_by_driver.dart';
import '../repo/signal_given_by_driver.dart';

class SignalInfoProvider with ChangeNotifier {
  final SignalInfoRepository repository;

  SignalInfoProvider({required this.repository});

  SignalInfo? _signalInfo;
  SignalInfo? get signalInfo => _signalInfo;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> loadSignalInfo(String collection, String document) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _signalInfo = await repository.fetchSignalInfo(collection, document);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}