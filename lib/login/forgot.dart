import 'package:flutter/material.dart';

class ForgotScreen extends StatelessWidget {
  const ForgotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot'),
      ),
      body: const Center(
        child: Text(
          'Forgot',
          style: TextStyle(
              fontSize: 20.0
          ),
        ),
      ),
    );
  }
}
