import 'package:flutter/widgets.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/utils/movie_parser.dart';

class MovieProvider extends ChangeNotifier {
  List<Movie> _movieList = [
    // "The Shawsank Redemption",
    // "The Godfather",
    // "The Dark Knight",
    // "The Godfather: Part II",
    // "The Lord of the Rings: The Return of the King",
    // "Pulp Friction",
    // "Schindler's List",
  ];

  List<Movie> get movieList => _movieList;

  Future<void> loadMovies(BuildContext context) async {
    try {
      final jsonString = await DefaultAssetBundle.of(context)
          .loadString('assets/data/films.json');

      final movies = MovieParser.parse(jsonString);

      _movieList = movies;

      notifyListeners();
    } catch (e) {
      print('Error loading movies');
    }
  }

  // List<String> loadMovies() {
  //   return _movieList;
  // }
}
