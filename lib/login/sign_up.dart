import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: const  Center(
        child: Text(
          'Sign Up',
          style: TextStyle(
            fontSize: 20.0
          ),
        ),
      ),
    );
  }
}
