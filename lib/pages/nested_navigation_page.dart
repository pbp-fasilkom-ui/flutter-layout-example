import 'dart:async';

import 'package:flutter/material.dart';

class NestedNavigationPage extends StatelessWidget {
  const NestedNavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nested Navigation Example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('This is the main page.'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                unawaited(Navigator.of(context).pushNamed(
                  '/nested-details',
                  arguments: {'id': '123'},
                ));
              },
              child: const Text('Go to Details Page with ID: 123'),
            ),
          ],
        ),
      ),
    );
  }
}
