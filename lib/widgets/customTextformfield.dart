import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  // Controller to manage text input
  final TextEditingController controller;
  // Label text for the input field
  final String label;
  // Prefix icon displayed inside the input field
  final IconData prefixIcon;
  // Determines whether the text should be hidden (for passwords)
  final bool isPassword;
  // Validator function to validate input
  final String? Function(String?)? validator;
  // Optional suffix icon (e.g., for toggling password visibility)
  final IconData? suffixIcon;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.prefixIcon,
    this.isPassword = false,
    this.validator,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword, // Hides text if it's a password field
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon), // Displays prefix icon
        labelText: label, // Displays label text
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ), // Adds rounded borders
        suffixIcon:
            suffixIcon != null
                ? Icon(suffixIcon)
                : null, // Displays suffix icon if provided
      ),
      validator: validator, // Applies validation function
    );
  }
}
