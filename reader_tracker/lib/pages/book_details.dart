import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reader_tracker/database/database_helper.dart';
import 'package:reader_tracker/models/book.dart';
import 'package:reader_tracker/utlis/book_details_arguments.dart';

class BookDetailsScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as BookDetailsArguments;
    final Book book = args.itemBook;



    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: Text(book.title)),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              if (book.thumbnailUrl != null)
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Image.network(
                    book.thumbnailUrl!,
                    scale: 1.2,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {

                      return const Icon(Icons.book, size: 80);
                    },
                  ),
                )
              else
                const Icon(Icons.book, size: 80),

              Column(
                children: [
                  Text(book.title, style: theme.headlineSmall),
                  Text(book.authors.join(', '), style: theme.labelLarge),
                  Text(
                    'Published ${book.publishedDate}',
                    style: theme.bodySmall,
                  ),
                  Text('Language ${book.language}', style: theme.bodySmall),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          // saving book to db
                          try {
                            int savedInt = await DatabaseHelper.instance.insert(
                              book,
                            );
                            SnackBar snackBar = SnackBar(
                              content: Text("Book Saved $savedInt"),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } catch (e) {
                            print("Error: $e");
                          }
                        },
                        child: Text('Save'),
                      ),
                      ElevatedButton.icon(
                        onPressed: () async {
                          try {
                            await DatabaseHelper.instance.readAllBooks().then(
                              (books) => {
                                for (var book in books)
                                  {print("Title: ${book.title}")},
                              },
                            );
                          } catch (e) {}
                        },
                        icon: Icon(Icons.favorite),
                        label: Text('Favorite'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  Text('Description', style: theme.titleMedium),

                  const SizedBox(height: 5),
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary
                          .withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    child: Text(book.description),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
