import 'package:flutter/material.dart';
import 'package:flowcast_flutter_ui/ui/screens/home_screen.dart';
import 'package:flowcast_flutter_ui/ui/themes/app_theme.dart';

void main() {
  runApp(const FlowCastApp());
}

class FlowCastApp extends StatefulWidget {
  const FlowCastApp({super.key});

  @override
  State<FlowCastApp> createState() => _FlowCastAppState();
}

class _FlowCastAppState extends State<FlowCastApp> {
  bool isDarkMode = false;

  void _toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlowCast',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: HomeScreen(
        isDayTime: !isDarkMode,
        onThemeToggle: _toggleTheme,
      ),
    );
  }
}
