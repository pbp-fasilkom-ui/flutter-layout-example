import 'package:flutter/material.dart';
import 'package:layout_example/pages/chatbot_page.dart';
import 'package:layout_example/pages/google_books_page.dart';
import 'package:layout_example/pages/more_widget_examples_page.dart';
import 'package:layout_example/pages/nested_details_page.dart';
import 'package:layout_example/pages/nested_navigation_page.dart';
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
        '/chatbot': (context) => const ChatbotPage(),
        '/nested-navigation': (context) => const NestedNavigationPage(),
        '/google-books': (context) => const GoogleBooksPage(),
        '/nested-details': (context) {
          final args = ModalRoute.of(context)!.settings.arguments
              as Map<String, String>?;
          return NestedDetailsPage(id: args?['id'] ?? '');
        },
      },
    );
  }
}
