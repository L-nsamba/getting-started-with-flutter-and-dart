import 'package:flutter/material.dart';
import 'package:reader_tracker/database/database_helper.dart';
import 'package:reader_tracker/models/book.dart';
import 'package:sqflite/sqlite_api.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<List<Book>>(
        future: DatabaseHelper.instance.readAllBooks(),
        builder: ((context, snapshot) => snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  Book book = snapshot.data![index];
                  print("Book ==> ${snapshot.data![index]}");
                  return Card(
                    child: ListTile(
                      title: Text(book.title),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          print("delete ${book.id}");
                          DatabaseHelper.instance.deleteBook(book.id);
                          setState(() {});
                        },
                      ),
                      leading: Image.network(
                        book.imageLinks['thumbnail'] ?? '',
                        fit: BoxFit.cover,
                      ),
                      subtitle: Column(
                        children: [
                          Text(book.authors.join(', ')),

                          ElevatedButton.icon(
                            onPressed: () async {
                              await DatabaseHelper.instance
                                  .toggleFavoriteStatus(
                                    book.id,
                                    book.isFavorite,
                                  )
                                  .then((value) => print("Item Favorited!!"));
                            },
                            icon: Icon(Icons.favorite),
                            label: Text('Add to Favorites'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            : const Center(child: CircularProgressIndicator())),
      ),
    );
  }
}
