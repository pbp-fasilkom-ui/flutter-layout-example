import 'package:flutter/material.dart';

class MoreWidgetExamplesPage extends StatelessWidget {
  const MoreWidgetExamplesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('More Widget Examples'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const <Widget>[
          ExampleSection(
            title: '1. Container',
            child: ContainerExample(),
          ),
          ExampleSection(
            title: '2. Expanded & Flexible',
            child: ExpandedFlexibleExample(),
          ),
          ExampleSection(
            title: '3. Stack',
            child: StackExample(),
          ),
          ExampleSection(
            title: '4. GridView',
            child: GridViewExample(),
          ),
        ],
      ),
    );
  }
}

class ExampleSection extends StatelessWidget {
  const ExampleSection({required this.title, required this.child, super.key});
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title, style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black26),
            borderRadius: BorderRadius.circular(8),
          ),
          child: child,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

class ContainerExample extends StatelessWidget {
  const ContainerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.amber.shade100,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.amber.shade600, width: 2),
      ),
      child: const Text(
        // Literal string for demo
        // ignore: lines_longer_than_80_chars
        'This is a Container widget. It has margin, padding, and a coloured border.',
        textAlign: TextAlign.center,
      ),
    );
  }
}

class ExpandedFlexibleExample extends StatelessWidget {
  const ExpandedFlexibleExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.all(8),
            color: Colors.blue,
            child: const Text(
              'Expanded (flex: 2)',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Container(
            padding: const EdgeInsets.all(8),
            color: Colors.green,
            child: const Text(
              'Flexible',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          // This is intentionally redundant for demonstration purposes.
          // ignore: avoid_redundant_argument_values
          flex: 1,
          child: Container(
            padding: const EdgeInsets.all(8),
            color: Colors.blue,
            child: const Text(
              'Expanded (flex: 1)',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

class StackExample extends StatelessWidget {
  const StackExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(width: 200, height: 200, color: Colors.red.shade200),
        Positioned(
          top: 20,
          right: 20,
          child: Container(width: 80, height: 80, color: Colors.red.shade400),
        ),
        const Icon(Icons.check_circle, color: Colors.white, size: 64),
      ],
    );
  }
}

class GridViewExample extends StatelessWidget {
  const GridViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: 12,
        itemBuilder: (BuildContext context, int index) {
          // For demonstration purpose. The proper way is using ColoredBox.
          // ignore: use_colored_box
          return Container(
            color: Colors.purple.shade100,
            child: Center(child: Text('Item $index')),
          );
        },
      ),
    );
  }
}
