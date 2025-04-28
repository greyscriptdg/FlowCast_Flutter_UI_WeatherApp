import 'package:flutter/material.dart';
import 'package:flowcast_flutter_ui/ui/animations/animated_weather_background.dart';
import 'package:flowcast_flutter_ui/models/weather_data.dart';
import 'package:flowcast_flutter_ui/ui/widgets/forecast_card.dart';

class HomeScreen extends StatelessWidget {
  final bool isDayTime;
  final VoidCallback onThemeToggle;

  const HomeScreen({
    super.key,
    required this.isDayTime,
    required this.onThemeToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedWeatherBackground(isDayTime: isDayTime),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text('FlowCast'),
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              IconButton(
                icon: const Icon(Icons.brightness_6),
                onPressed: onThemeToggle,
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                const Text(
                  "5-Day Forecast",
                  style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 160,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: mockWeatherData.length,
                    itemBuilder: (context, index) {
                      final data = mockWeatherData[index];
                      return ForecastCard(
                        day: data.day,
                        temperature: data.temperature,
                        weatherIcon: data.iconPath,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
