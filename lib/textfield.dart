import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController controller;
  String hintText;
  final TextInputType? keyboardType;
  CustomTextField(
      {required this.controller, required this.hintText, this.keyboardType,super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 16),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.teal, width: 2),
          ),
        ),
      ),
    );
  }
}
