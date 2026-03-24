import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final bool isPassword;
  final bool obscureText;
  final VoidCallback? onToggleVisibility;
  final Function(String)? onChanged;
  final Color? labelColor;

  const CustomInputField({
    super.key,
    required this.label,
    this.isPassword = false,
    this.obscureText = false,
    this.onToggleVisibility,
    this.onChanged,
    this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword ? obscureText : false,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: labelColor ?? Colors.grey),
        suffixIcon: isPassword
            ? IconButton(
          icon: Icon(
            obscureText ? Icons.visibility_off : Icons.visibility,
            color: labelColor ?? Colors.grey,
          ),
          onPressed: onToggleVisibility,
        )
            : null,
      ),
    );
  }
}