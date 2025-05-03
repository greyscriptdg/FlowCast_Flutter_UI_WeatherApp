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
<<<<<<< Updated upstream
=======

class CloudPainter extends CustomPainter {
  final double animationValue;
  final bool isDayTime;

  CloudPainter({required this.animationValue, required this.isDayTime});

  @override
  void paint(Canvas canvas, Size size) {
    // Paint the full background gradient first
    final Paint bgPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: isDayTime
            ? [const Color(0xFF89CFF0), const Color(0xFF4682B4)] // Light blue gradient
            : [const Color(0xFF0D1B2A), const Color(0xFF1B263B)], // Dark blue gradient
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bgPaint);

    // Cloud color
    final cloudPaint = Paint()
      ..color = isDayTime
          ? Colors.white.withOpacity(0.5)
          : Colors.white.withOpacity(0.3); // Light grayish in dark mode

    // Move the cloud horizontally across the screen in a loop
    final double cloudWidth = 200;
    final double cloudHeight = 100;
    final double xPosition = (size.width + cloudWidth) * animationValue - cloudWidth;
    final double yPosition = size.height * 0.2;

    drawCloud(canvas, Offset(xPosition, yPosition), cloudWidth, cloudHeight, cloudPaint);
    drawCloud(canvas, Offset(xPosition - 250, yPosition + 60), cloudWidth * 0.8, cloudHeight * 0.8, cloudPaint);
    drawCloud(canvas, Offset(xPosition - 500, yPosition + 30), cloudWidth * 1.2, cloudHeight * 1.2, cloudPaint);
  }

  void drawCloud(Canvas canvas, Offset offset, double width, double height, Paint paint) {
    final cloudPath = Path()
      ..addOval(Rect.fromCircle(center: offset, radius: width * 0.3))
      ..addOval(Rect.fromCircle(center: Offset(offset.dx + width * 0.3, offset.dy - height * 0.2), radius: width * 0.25))
      ..addOval(Rect.fromCircle(center: Offset(offset.dx + width * 0.6, offset.dy), radius: width * 0.35))
      ..addOval(Rect.fromCircle(center: Offset(offset.dx + width * 0.3, offset.dy + height * 0.2), radius: width * 0.25));

    canvas.drawPath(cloudPath, paint);
  }

  @override
  bool shouldRepaint(covariant CloudPainter oldDelegate) {
    return oldDelegate.animationValue != animationValue || oldDelegate.isDayTime != isDayTime;
  }
}
>>>>>>> Stashed changes
