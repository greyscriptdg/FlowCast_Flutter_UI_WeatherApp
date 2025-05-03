import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedWeatherBackground extends StatefulWidget {
  final bool isDayTime;

  const AnimatedWeatherBackground({super.key, required this.isDayTime});

  @override
  State<AnimatedWeatherBackground> createState() => _AnimatedWeatherBackgroundState();
}

class _AnimatedWeatherBackgroundState extends State<AnimatedWeatherBackground> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    )..repeat(); // Infinite loop
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: CloudPainter(
            animationValue: _controller.value,
            isDayTime: widget.isDayTime,
          ),
          child: SizedBox(width: size.width, height: size.height),
        );
      },
    );
  }
}

class CloudPainter extends CustomPainter {
  final double animationValue;
  final bool isDayTime;

  CloudPainter({required this.animationValue, required this.isDayTime});

  @override
  void paint(Canvas canvas, Size size) {
    final cloudPaint = Paint()
      ..color = isDayTime ? Colors.white.withOpacity(0.4) : Colors.blueGrey.withOpacity(0.4);

    // Move the cloud horizontally across the screen in a loop
    final double cloudWidth = 200;
    final double cloudHeight = 100;
    final double xPosition = (size.width + cloudWidth) * animationValue - cloudWidth;
    final double yPosition = size.height * 0.2;

    drawCloud(canvas, Offset(xPosition, yPosition), cloudWidth, cloudHeight);
    drawCloud(canvas, Offset(xPosition - 250, yPosition + 60), cloudWidth * 0.8, cloudHeight * 0.8);
    drawCloud(canvas, Offset(xPosition - 500, yPosition + 30), cloudWidth * 1.2, cloudHeight * 1.2);
  }

  void drawCloud(Canvas canvas, Offset offset, double width, double height) {
    final cloudPath = Path()
      ..addOval(Rect.fromCircle(center: offset, radius: width * 0.3))
      ..addOval(Rect.fromCircle(center: Offset(offset.dx + width * 0.3, offset.dy - height * 0.2), radius: width * 0.25))
      ..addOval(Rect.fromCircle(center: Offset(offset.dx + width * 0.6, offset.dy), radius: width * 0.35))
      ..addOval(Rect.fromCircle(center: Offset(offset.dx + width * 0.3, offset.dy + height * 0.2), radius: width * 0.25));

    canvas.drawPath(cloudPath, Paint()..color = Colors.white.withOpacity(0.5));
  }

  @override
  bool shouldRepaint(covariant CloudPainter oldDelegate) {
    return oldDelegate.animationValue != animationValue || oldDelegate.isDayTime != isDayTime;
  }
}
