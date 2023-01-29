import 'package:bloc_practice/commons/constants.dart';
import 'package:flutter/material.dart';

class FlitTextField extends StatelessWidget {
  const FlitTextField(
      {this.onChanged,
      this.labelText,
      this.hintText,
      this.errorText,
      this.icon,
      this.prefixIcon,
      this.suffixIcon,
      this.obscureText,
      Key? key})
      : super(key: key);

  final void Function(String)? onChanged;

  final bool? obscureText;

  final String? labelText;

  final String? hintText;

  final String? errorText;

  final Icon? prefixIcon;

  final Icon? suffixIcon;

  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      obscureText: obscureText ?? false,
      style: const TextStyle(
        fontSize: 16,
      ),
      decoration: InputDecoration(
        icon: icon,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        labelText: labelText,
        errorText: errorText,
        focusColor: Colors.black,
        filled: true,
        fillColor: const Color(0xFFf6f8f9),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
          borderSide: const BorderSide(
            style: BorderStyle.none,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
          borderSide: const BorderSide(
            color: Color(0xFFdde2e4),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
          borderSide: const BorderSide(
            color: Color(0xff949899),
            width: 1.3,
          ),
        ),
      ),
    );
  }
}
