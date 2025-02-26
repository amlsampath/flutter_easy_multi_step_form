import 'package:flutter/material.dart';

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
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10),
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
