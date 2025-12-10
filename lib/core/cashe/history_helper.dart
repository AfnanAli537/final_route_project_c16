import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class HistoryHelper {
  static const String _historyKey = 'history';

  static Future<List<Map<String, String>>> getHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = prefs.getStringList(_historyKey) ?? [];
    return jsonList
        .map((item) => Map<String, String>.from(json.decode(item)))
        .toList();
  }

  static Future<void> addToHistory(
    String title,
    String image,
    String rating,
    String id,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final history = await getHistory();

    history.removeWhere((item) => item['id'] == id);
    history.insert(0, {
      'id': id,
      'title': title,
      'image': image,
      'rating': rating,
    });

    final jsonList = history.map((item) => json.encode(item)).toList();
    await prefs.setStringList(_historyKey, jsonList);
  }

  static Future<void> clearHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_historyKey);
  }
}
