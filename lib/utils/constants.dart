import 'package:flutter/material.dart';

class AppConstants {
  // Animation durations
  static const Duration animationDuration = Duration(milliseconds: 300);
  static const Duration longAnimationDuration = Duration(milliseconds: 500);

  // Padding and spacing
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;

  // Border radius
  static const double defaultBorderRadius = 12.0;
  static const double largeBorderRadius = 24.0;

  // Colors
  static const Color sunnyColor = Color(0xFFFFD700);
  static const Color rainyColor = Color(0xFF2196F3);
  static const Color cloudyColor = Color(0xFF9E9E9E);
  static const Color snowyColor = Color(0xFFE0E0E0);

  // Asset paths
  static const String assetsImagesPath = 'assets/images/';
  static const String assetsLottiePath = 'assets/lottie/';
} 