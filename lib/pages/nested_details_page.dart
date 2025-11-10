import 'package:flutter/material.dart';

class NestedDetailsPage extends StatelessWidget {
  const NestedDetailsPage({required this.id, super.key});
  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Page'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('This is the details page.'),
            const SizedBox(height: 20),
            Text('Received ID: $id'),
          ],
        ),
      ),
    );
  }
}
