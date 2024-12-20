import 'package:flutter/cupertino.dart';

import '../model/security.dart';
import '../repo/secuurity_repo.dart';

class SecurityNotifier extends ChangeNotifier {
  Security? _securityData;

  Security? get securityData => _securityData;

  Future<void> fetchData() async {
    try {
      SecurityRepository repository = SecurityRepository();
      _securityData = await repository.getSecurityData();
      notifyListeners();
    } catch (e) {
      print("Error fetching data: $e");
    }
  }
}
