import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Information'),
      ),
      body:  Center(
        child: TextButton(
          onPressed: () {
            GoRouter.of(context).push('/details/overview');
          },
          child: const Text(
            'Information',
            style: TextStyle(
                fontSize: 20.0
            ),
          ),
        ),
      ),
    );
  }
}
