import 'package:flutter/material.dart';

class FormTheme {
  static const Color primaryColor = Color(0xFF6C63FF);
  static const Color secondaryColor = Color(0xFF2A2A2A);
  static const Color backgroundColor = Color(0xFFF8F9FA);
  static const Color successColor = Color(0xFF40B273);
  static const Color errorColor = Color(0xFFE74C3C);

  static const double borderRadius = 12.0;
  static const double spacing = 16.0;

  static BoxDecoration cardDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(borderRadius),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withAlpha(13), // Changed from withOpacity(0.05)
        blurRadius: 10,
        offset: const Offset(0, 2),
      ),
    ],
  );
}
