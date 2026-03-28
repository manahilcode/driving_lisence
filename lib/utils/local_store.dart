import 'package:shared_preferences/shared_preferences.dart';

class LocalStore {
  static const _completedKey = 'completed_count';

  Future<int> getCompletedCount() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_completedKey) ?? 0;
  }

  Future<void> incrementCompletedCount() async {
    final prefs = await SharedPreferences.getInstance();
    final current = prefs.getInt(_completedKey) ?? 0;
    await prefs.setInt(_completedKey, current + 1);
  }

  Future<void> resetProgress() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_completedKey);
  }
}

