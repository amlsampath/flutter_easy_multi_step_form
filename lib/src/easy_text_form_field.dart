import 'package:flutter/material.dart';


/// A customizable text form field widget with enhanced styling and validation.
class EasyTextFormField extends StatelessWidget {
  /// Creates an [EasyTextFormField].
  const EasyTextFormField({
    super.key,
    required this.label,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.backgroundColor = const Color(0x1A04FF19),
    this.validator,
  });

  /// Label text displayed above the form field.
  final String label;

  /// Defines the keyboard type for the input field.
  final TextInputType keyboardType;

  /// Whether the text should be obscured (useful for passwords).
  final bool obscureText;

  /// Controller for managing text input.
  final TextEditingController controller;

  /// Background color of the text field container.
  final Color backgroundColor;

  /// Validator function to check input validity.
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 6),
          TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
            validator: validator,
            decoration: InputDecoration(
              labelText: label,
              labelStyle: TextStyle(
                fontSize: 14,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
