import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              GoRouter.of(context).go('/home');
            },
            child: const Text(
              'LoginScreen',
              style: TextStyle(
                fontSize: 20.0
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              GoRouter.of(context).go('/login/sign_up');
            },
            child: const Text('Sign Up')
          ),
          TextButton(
            onPressed: () {
              GoRouter.of(context).push('/login/forgot');
            },
            child: const Text('Forgot Password')
          )
        ],
      ),
    );
  }
}

