import 'package:flutter/material.dart';

void main() {
  runApp(const FlumeExample());
}

class FlumeExample extends StatelessWidget {
  const FlumeExample({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flume',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flume'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
