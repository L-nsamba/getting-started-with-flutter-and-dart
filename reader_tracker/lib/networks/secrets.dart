import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class Secrets {
  static Map<String, dynamic>? _data;

  static Future<void> load() async {
    final jsonString = await rootBundle.loadString('lib/assets/secrets.json');    _data = json.decode(jsonString);
  }

  static String? get(String key) => _data?[key];
}
