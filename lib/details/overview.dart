import 'package:flutter/material.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Overview'),
      ),
      body: const Center(
        child: Text(
          'Overview',
          style: TextStyle(
              fontSize: 20.0
          ),
        ),
      ),
    );
  }
}
