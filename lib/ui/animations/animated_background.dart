import 'package:flutter/material.dart';
import '../../utils/constants.dart';

class AnimatedBackground extends StatelessWidget {
  final String weatherCondition;
  final Widget child;

  const AnimatedBackground({
    super.key,
    required this.weatherCondition,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Placeholder for weather-specific background
        Container(
          decoration: BoxDecoration(
            gradient: _getGradientForCondition(weatherCondition),
          ),
        ),
        // Child content
        child,
      ],
    );
  }

  LinearGradient _getGradientForCondition(String condition) {
    switch (condition.toLowerCase()) {
      case 'sunny':
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppConstants.sunnyColor, Colors.white],
        );
      case 'rainy':
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppConstants.rainyColor, Colors.white],
        );
      case 'cloudy':
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppConstants.cloudyColor, Colors.white],
        );
      case 'snowy':
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppConstants.snowyColor, Colors.white],
        );
      default:
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.blue, Colors.white],
        );
    }
  }
} 