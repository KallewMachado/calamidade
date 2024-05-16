import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Column(
        children: [
          const Placeholder(),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/ask_help/new_ask_help');
            },
            child: const Text('New ask help'),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/auth/not_affiliated');
              },
              child: const Text(
                'Página não cooperado',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
