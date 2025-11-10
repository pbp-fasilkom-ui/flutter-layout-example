import 'package:flutter/material.dart';
import 'package:layout_example/models/book_volume.dart';

class BookDetailPage extends StatelessWidget {

  const BookDetailPage({required this.book, super.key});
  final BookVolume book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.volumeInfo.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                book.volumeInfo.title,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                'by ${book.volumeInfo.authors?.join(', ') ?? 'No authors'}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 16),
              Text(
                // Literal string for demo
                // ignore: lines_longer_than_80_chars
                'Published by: ${book.volumeInfo.publisher ?? 'N/A'} on ${book.volumeInfo.publishedDate ?? 'N/A'}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 16),
              Text(
                'Description',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                book.volumeInfo.description ?? 'No description available.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
