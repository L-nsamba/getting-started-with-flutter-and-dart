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
  // final _movieList = <String>[
  //   "The Shawsank Redemption",
  //   "The Godfather",
  //   "The Dark Knight",
  //   "The Godfather: Part II",
  //   "The Lord of the Rings: The Return of the King",
  //   "Pulp Friction",
  //   "Schindler's List",
  // ];

  @override
  Widget build(BuildContext context) {
    final movies = Provider.of<MovieProvider>(context).loadMovies();
    return Scaffold(
      appBar: AppBar(title: Text("Movies")),
      body: Center(
        child: ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            // return Card(
            //   child: Center(child: Text(movies[index]),)
            //   );
            return ListTile(
            title: Text(movies[index]),
            subtitle: Text('sub'),
            trailing: Icon(Icons.generating_tokens_outlined),
            leading: CircleAvatar(
              child: Text(movies[index][0]),
            ),);
          },
        ),
      ),
    );
  }
}
