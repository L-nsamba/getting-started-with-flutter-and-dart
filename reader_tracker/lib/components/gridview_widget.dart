import 'package:flutter/material.dart';
import 'package:reader_tracker/models/book.dart';
import 'package:reader_tracker/utlis/book_details_arguments.dart';

class GridViewWidget extends StatelessWidget {
  const new({super.key, required this._books});

  final List<Book> _books;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: _books.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.6,
        ),
        itemBuilder: ((context, index) {
          Book book = _books[index];
          return Container(
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceVariant,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: GestureDetector(
              onTap: () {
                // Navigate to details screens
                Navigator.pushNamed(
                  context,
                  '/details',
                  arguments: BookDetailsArguments(itemBook: book, isFromSavedScreen: false),
                );
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Image.network(
                      book.thumbnailUrl ?? '',
                      errorBuilder: (context, error, stackTrace) {
                        debugPrint('Failed image URL: ${book.thumbnailUrl}');
                        return const Icon(Icons.book, size: 50);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      book.title,
                      style: Theme.of(context).textTheme.titleSmall,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      book.authors.join(', &'),
                      style: Theme.of(context).textTheme.bodySmall,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
