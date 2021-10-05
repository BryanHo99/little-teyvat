import 'dart:convert';

import 'package:flutter/services.dart';

/// Decodes a locally stored JSON file.
Future<Map<String, dynamic>> getJson(String jsonFilePath) async {
  final String response = await rootBundle.loadString(jsonFilePath);
  return await json.decode(response);
}
