// lib/ui/animations/animated_weather_background.dart

import 'package:flutter/material.dart';

class AnimatedWeatherBackground extends StatelessWidget {
  final bool isDayTime;

  const AnimatedWeatherBackground({super.key, required this.isDayTime});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Sky background
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: isDayTime
                  ? [Colors.lightBlue.shade300, Colors.blue.shade700]
                  : [Colors.indigo.shade900, Colors.black],
            ),
          ),
        ),
        // TODO: Add animated sun/moon here
        // TODO: Add moving clouds here
        // TODO: Add rain, snow, wind particles here
      ],
    );
  }
}
