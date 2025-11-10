import 'dart:async';

import 'package:flutter/material.dart';

class OriginalExamplePage extends StatelessWidget {
  const OriginalExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Layouts with Row and Column')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Widgets arranged in a Column:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(onPressed: () {}, child: const Text('Button 1')),
                ElevatedButton(onPressed: () {}, child: const Text('Button 2')),
                ElevatedButton(onPressed: () {}, child: const Text('Button 3')),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'This text is also in the Column, below the Row.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () {
                unawaited(
                  Navigator.pushNamed(context, '/more-widget-examples'),
                );
              },
              label: const Text('More Widget Examples'),
              icon: const Icon(Icons.arrow_forward),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                unawaited(Navigator.pushNamed(context, '/chatbot'));
              },
              label: const Text('AI Chatbot'),
              icon: const Icon(Icons.chat),
            ),
          ],
        ),
      ),
    );
  }
}
