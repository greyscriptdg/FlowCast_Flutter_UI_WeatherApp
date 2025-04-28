import 'package:flutter/material.dart';

class CloudLayer extends StatefulWidget {
  const CloudLayer({super.key});

  @override
  State<CloudLayer> createState() => _CloudLayerState();
}

class _CloudLayerState extends State<CloudLayer> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 30), // Slower movement for peaceful cloud effect
      vsync: this,
    )..repeat();

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(-MediaQuery.of(context).size.width * _animation.value, 0),
          child: child,
        );
      },
      child: Image.asset(
        'assets/images/cloudy.png', // Using existing cloud image
        fit: BoxFit.cover,
        width: MediaQuery.of(context).size.width * 2, // 2x width for smooth endless movement
      ),
    );
  }
}
