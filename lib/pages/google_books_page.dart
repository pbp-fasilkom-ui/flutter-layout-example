import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GoogleBooksPage extends StatefulWidget {
  const GoogleBooksPage({super.key});

  @override
  State<GoogleBooksPage> createState() => _GoogleBooksPageState();
}

class _GoogleBooksPageState extends State<GoogleBooksPage> {
  final TextEditingController _controller = TextEditingController();
  List<dynamic> _books = [];
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
        _books = data['items'] as List<dynamic>;
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
      // Handle error
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
                    final book = _books[index] as Map<String, dynamic>;
                    final volumeInfo =
                        book['volumeInfo'] as Map<String, dynamic>;
                    final authors = volumeInfo['authors'] as List<dynamic>?;
                    return ListTile(
                      title: Text(volumeInfo['title'] as String),
                      subtitle: Text(authors?.join(', ') ?? 'No authors'),
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
