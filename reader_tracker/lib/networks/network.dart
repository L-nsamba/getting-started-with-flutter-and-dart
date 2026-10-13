import 'package:http/http.dart' as http;
import 'package:reader_tracker/models/book.dart';
import 'package:reader_tracker/networks/secrets.dart';

import 'dart:convert';

class Network {
  static const String _baseUrl = 'https://www.googleapis.com/books/v1/volumes';

  Future<List<Book>> searchBooks(String query) async {
    final apiKey = Secrets.get("GOOGLE_BOOKS_API_KEY");
    final url = Uri.parse(
      'https://www.googleapis.com/books/v1/volumes?q=$query&key=$apiKey',
    );
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      if (data['items'] != null && data['items'] is List) {
        List<Book> books = (data['items'] as List<dynamic>)
            .map((book) => Book.fromJson(book as Map<String, dynamic>))
            .toList();
        return books;
      } else {
        return [];
      }
    } else {
      throw Exception('Failed to load books');
    }
  }
}
