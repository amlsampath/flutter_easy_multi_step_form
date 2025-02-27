import 'package:flutter/material.dart';
import 'theme/form_theme.dart';

class MultiStepElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color foregroundColor;
  final Color backgroundColor;
  final String text;
  const MultiStepElevatedButton({
    super.key,
    required this.onPressed,
    this.foregroundColor = Colors.white,
    this.backgroundColor = Colors.black,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      height: size.height * 0.06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(FormTheme.borderRadius),
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.black26 : backgroundColor.withAlpha(50),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(FormTheme.borderRadius),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.04,
            vertical: size.height * 0.015,
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: foregroundColor,
            fontSize: size.width * 0.04,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
