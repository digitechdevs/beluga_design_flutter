import 'package:flutter/material.dart';

void main() {
  runApp(const Beluga());
}

class Beluga extends StatelessWidget {
  const Beluga({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Beluga Design!'),
        ),
      ),
    );
  }
}
