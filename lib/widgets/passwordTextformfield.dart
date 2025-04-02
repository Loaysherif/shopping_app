import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  // Controller to manage text input
  final TextEditingController controller;
  // Label text for the input field
  final String label;
  // Prefix icon displayed inside the input field
  final IconData prefixIcon;
  // Validator function to validate input
  final String? Function(String?)? validator;

  const PasswordTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.prefixIcon,
    this.validator,
  });

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _isPasswordHidden = true; // Tracks password visibility state

  // Function to toggle password visibility
  void _togglePassword() {
    setState(() {
      _isPasswordHidden = !_isPasswordHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller, // Assigns the controller
      obscureText: _isPasswordHidden, // Hides/shows password based on state
      decoration: InputDecoration(
        prefixIcon: Icon(widget.prefixIcon), // Displays prefix icon
        labelText: widget.label, // Sets label text
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ), // Rounded borders
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordHidden
                ? Icons.visibility_off
                : Icons.visibility, // Toggle icon
          ),
          onPressed: _togglePassword, // Toggles password visibility
        ),
      ),
      validator: widget.validator, // Applies validation function
    );
  }
}
