import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:reader_tracker/models/book.dart';
import 'package:reader_tracker/networks/secrets.dart';

import 'dart:convert';

class Network {
  static const String _baseUrl = 'https://www.googleapis.com/books/v1/volumes';

  Future<List<Book>> searchBooks(String query) async {
    final apiKey = Secrets.get("GOOGLE_BOOKS_API_KEY");

    final url = Uri.https('www.googleapis.com', '/books/v1/volumes', {
      'q': query,
      'key': apiKey,
    });


    late http.Response response;

    for (int attempt = 1; attempt <= 3; attempt++) {
      response = await http.get(url);

      debugPrint(
        'API status: ${response.statusCode} '
        '(attempt $attempt)',
      );

      if (response.statusCode != 503 || attempt == 3) {
        break;
      }

      await Future.delayed(Duration(seconds: attempt * 2));
    }

    debugPrint('API status: ${response.statusCode}');

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      if (data['items'] != null && data['items'] is List) {
        final books = (data['items'] as List<dynamic>)
            .map((book) => Book.fromJson(book as Map<String, dynamic>))
            .toList();

        return books;
      }

      return [];
    } else {
      debugPrint('API response: ${response.body}');
      throw Exception('Failed to load books: HTTP ${response.statusCode}');
    }
  }
}
