import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:layout_example/models/book_volume.dart';
import 'package:layout_example/models/books_response.dart';

class GoogleBooksPage extends StatefulWidget {
  const GoogleBooksPage({super.key});

  @override
  State<GoogleBooksPage> createState() => _GoogleBooksPageState();
}

class _GoogleBooksPageState extends State<GoogleBooksPage> {
  final TextEditingController _controller = TextEditingController();
  List<BookVolume> _books = [];
  bool _isLoading = false;

  Future<void> _searchBooks() async {
    if (_controller.text.isEmpty) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final response = await http.get(
      Uri.parse(
          'https://www.googleapis.com/books/v1/volumes?q=${_controller.text}'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as Map<String, dynamic>;
      setState(() {
        _books = BooksResponse.fromJson(data).books;
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Books Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Search for books',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: _searchBooks,
                ),
              ),
              onSubmitted: (_) => _searchBooks(),
            ),
            const SizedBox(height: 16),
            if (_isLoading)
              const CircularProgressIndicator()
            else
              Expanded(
                child: ListView.builder(
                  itemCount: _books.length,
                  itemBuilder: (context, index) {
                    final book = _books[index];
                    return ListTile(
                      title: Text(book.volumeInfo.title),
                      subtitle: Text(
                          book.volumeInfo.authors?.join(', ') ?? 'No authors'),
                      onTap: () {
                        unawaited(Navigator.pushNamed(
                          context,
                          '/book-details',
                          arguments: book,
                        ));
                      },
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
