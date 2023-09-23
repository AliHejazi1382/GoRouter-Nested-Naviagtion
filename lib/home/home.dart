import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              'Home',
              style: TextStyle(
                fontSize: 20.0
              ),
            ),
            TextButton(
              onPressed: () {
                GoRouter.of(context).push('/details');
              },
              child: const Text('Detail Screen')
            )
          ],
        )
      ),
    );
  }
}
