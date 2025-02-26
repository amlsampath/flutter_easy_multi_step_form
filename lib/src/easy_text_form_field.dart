// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EasyTextFormField extends StatelessWidget {
  final String label;
  final TextInputType keyboardType;
  final bool obscureText;
  final TextEditingController controller;
  final Color backgroundColor;
  final String? Function(String?)? validator;

  const EasyTextFormField({
    super.key,
    required this.label,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    required this.controller,
    this.backgroundColor = const Color.fromARGB(26, 4, 255, 25),
    this.validator,
  });

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
              validator:
                  validator ??
                  (value) => value!.isEmpty ? '$label is required' : null,
            ),
          ),
        ],
      ),
    );
  }
}
