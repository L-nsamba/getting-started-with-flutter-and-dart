import 'package:http/http.dart' as http;
import 'package:reader_tracker/networks/secrets.dart';

import 'dart:convert';

class Network {
  static const String _baseUrl = 'https://www.googleapis.com/books/v1/volumes';

  Future<Map<String, dynamic>?> searchBooks(String query) async {
    final apiKey = Secrets.get("GOOGLE_BOOKS_API_KEY");
    final url = Uri.parse(
      'https://www.googleapis.com/books/v1/volumes?q=$query&key=$apiKey',
    );
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else {
      return null;
    }
  }
}
