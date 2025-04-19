import 'package:flutter/material.dart';
import '../widgets/theme_toggle.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FlowCast'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: ThemeToggle(),
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Weather Forecast Coming Soon',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
} 