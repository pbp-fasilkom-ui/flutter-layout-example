import 'package:flutter/material.dart';
import 'package:layout_example/models/book_volume.dart';
import 'package:layout_example/pages/book_detail_page.dart';
import 'package:layout_example/pages/google_books_page.dart';
import 'package:layout_example/pages/more_widget_examples_page.dart';
import 'package:layout_example/pages/original_example_page.dart';

void main() {
  runApp(const LayoutsFormsExample());
}

class LayoutsFormsExample extends StatelessWidget {
  const LayoutsFormsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Layout Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const OriginalExamplePage(),
        '/more-widget-examples': (context) => const MoreWidgetExamplesPage(),
        '/google-books': (context) => const GoogleBooksPage(),
        '/book-details': (context) {
          final book = ModalRoute.of(context)!.settings.arguments;
          if (book is BookVolume) {
            return BookDetailPage(book: book);
          }
          throw Exception('Invalid arguments for /book-details');
        },
      },
    );
  }
}
