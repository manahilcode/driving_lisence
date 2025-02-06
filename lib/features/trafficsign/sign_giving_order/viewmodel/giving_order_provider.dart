// lib/providers/sign_giving_orders_provider.dart
import 'package:flutter/material.dart';

import '../model/giving_order_model.dart';
import '../repo/giving_order_repo.dart';

class SignGivingOrdersProvider extends ChangeNotifier {
  final SignGivingOrdersRepository repository;

  SignGivingOrdersProvider({required this.repository});

  bool isLoading = false;
  SignGivingOrders? signGivingOrders;

  Future<void> fetchSignGivingOrders() async {
    isLoading = true;
    notifyListeners();

    try {
      signGivingOrders = await repository.getSignGivingOrders();
    } catch (e) {
      debugPrint('Error fetching sign giving orders: $e');
    }

    isLoading = false;
    notifyListeners();
  }
}
