import 'package:flutter/material.dart';

class SpecialTextfield extends StatelessWidget {
  final TextEditingController text;
  final String hintText;
  final bool obscureText;
  const SpecialTextfield({super.key,
  required this.text,
  required this.hintText,
  required this.obscureText});
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 200.0),
      child: TextField(
        obscureText: obscureText,
        controller: text,
        decoration: InputDecoration(
          hintText: hintText,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            fillColor: Colors.grey.shade200,
            filled: true
          ),
      ),
    );
  }
}