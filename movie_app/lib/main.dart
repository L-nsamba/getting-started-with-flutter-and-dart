import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movie_app/providers/movie_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MovieProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const new({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    Provider.of<MovieProvider>(context, listen: false).loadMovies(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final movieData = Provider.of<MovieProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Movies")),
      body: Center(
        child: ListView.builder(
          itemCount: movieData.movieList.length,
          itemBuilder: (context, index) {
            // return Card(
            //   child: Center(child: Text(movies[index]),)
            //   );
            final movie = movieData.movieList[index];
            return ListTile(
              title: Text(movieData.movieList[index].title),
              subtitle: Text(movie.director),
              // trailing: Icon(Icons.generating_tokens_outlined),
              leading: CircleAvatar(child: Text(movie.title[0])),
            );
          },
        ),
      ),
    );
  }
}
