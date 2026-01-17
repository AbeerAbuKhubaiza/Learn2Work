import 'package:flutter/material.dart';

abstract class AppColors {
  static const primary = Color(0xFF1F2145);
  static const secondary = Color(0xFFFDC92F);
  static const background = Colors.white;

  static const textPrimary = Color(0xFF1F2145);
  static const textSecondary = Color(0xFF6B6D7A);

  static const indicatorInactive = Color(0xFFE7E8EF);
}

abstract class AppDurations {
  static const splash = Duration(milliseconds: 9400);
  static const pageAnim = Duration(milliseconds: 450);
}

abstract class AppAssets {
  static const logo = 'assets/logo.png';
  static const topCorner = 'assets/top_corner.png';
  static const bottomCorner = 'assets/bottom_corner.png';

  static const onb1 = 'assets/bording1.png';
  static const onb2 = 'assets/bording2.png';
  static const onb3 = 'assets/bording3.png';
}
