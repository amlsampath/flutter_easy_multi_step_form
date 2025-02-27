// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// A customizable text form field widget that provides enhanced styling and validation capabilities.
///
/// This widget extends Flutter's basic TextFormField with additional styling options
/// and simplified validation handling.
class EasyTextFormField extends StatelessWidget {
  /// Creates an EasyTextFormField widget.
  ///
  /// The [label] parameter is required and displayed as the field's label.
  const EasyTextFormField({
    super.key,
    required this.label,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    required this.controller,
    this.backgroundColor = const Color.fromARGB(26, 4, 255, 25),
    this.validator,
  });

  /// The label text displayed above the form field.
  final String label;

  /// The text input type for the form field.
  ///
  /// Defaults to [TextInputType.text].
  final TextInputType keyboardType;

  /// Whether the text is obscured (e.g., for passwords).
  ///
  /// Defaults to false.
  final bool obscureText;

  /// The text editing controller for the form field.
  ///
  /// Controls the text being edited in the form field.
  final TextEditingController controller;

  /// The background color of the form field.
  ///
  /// Defaults to the theme's background color if not specified.
  final Color backgroundColor;

  /// Optional validator function that returns an error message string
  /// if the input is invalid, and null otherwise.
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
          ),
          SizedBox(height: 5),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: backgroundColor,
            ),
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                labelText: label,
                border: InputBorder.none,
              ),
              keyboardType: keyboardType,
              obscureText: obscureText,
              validator: validator,
            ),
          ),
        ],
      ),
    );
  }
}
