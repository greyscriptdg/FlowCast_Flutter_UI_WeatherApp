import 'package:flutter/material.dart';
import 'package:flowcast_flutter_ui/ui/animations/cloud_layer.dart'; // Import the CloudLayer

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
        // Moving cloud layer
        const CloudLayer(),
      ],
    );
  }
}
