import 'package:flutter/widgets.dart';

class MovieProvider extends ChangeNotifier{
  final List<String> _movieList = [
    "The Shawsank Redemption",
    "The Godfather",
    "The Dark Knight",
    "The Godfather: Part II",
    "The Lord of the Rings: The Return of the King",
    "Pulp Friction",
    "Schindler's List",
  ];

  List<String> get movieList => _movieList;

  List<String> loadMovies() {
    return _movieList;
  }
}