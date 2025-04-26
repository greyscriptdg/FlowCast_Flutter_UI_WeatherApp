// lib/ui/widgets/forecast_card.dart

import 'package:flutter/material.dart';

class ForecastCard extends StatelessWidget {
  final String day;
  final String temperature;
  final String weatherIcon;

  const ForecastCard({
    super.key,
    required this.day,
    required this.temperature,
    required this.weatherIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.3)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(day, style: TextStyle(color: Colors.white)),
          const SizedBox(height: 8),
          Image.asset(
            weatherIcon,
            width: 40,
            height: 40,
          ),
          const SizedBox(height: 8),
          Text(
            temperature,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
