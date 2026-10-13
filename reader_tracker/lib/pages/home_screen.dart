import 'package:flutter/material.dart';
import 'package:reader_tracker/models/book.dart';
import 'package:reader_tracker/networks/network.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Network network = Network();
  List<Book> _books = [];

  Future<void> _searchBooks(String query) async {
    try {
      List<Book> books = await network.searchBooks(query);
      setState(() {
        _books = books;
      });
      // print("Books: ${books.toString()}");
    } catch (e) {
      print("Didn't get anything...");
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _searchBooks('Android');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for a book',
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                onSubmitted: (query) => _searchBooks(query),
              ),
            ),

            Expanded(
              child: Container(
                width: double.infinity,
                child: ListView.builder(
                  itemCount: _books.length,
                  itemBuilder: (context, index) {
                    Book book = _books[index];
                    return ListTile(
                      title: Text(book.title),
                      subtitle: Text(book.authors.join(', &') ?? ''),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
