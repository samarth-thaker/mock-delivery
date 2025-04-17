import 'package:deliveryapp/getOTPButton.dart';
import 'package:deliveryapp/textfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3FAFB),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/logo.jpg', height: 40),
                SizedBox(width: 8),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Discover zero waste\nlifestyle.\nGet a Reuseall bag and\nreturn it after use.',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1C445A),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Phone no',
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 8),
            CustomTextField(
              controller: phoneController,
              hintText: 'Enter 10 digit phone no',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 24),
            const Getotpbutton(),
          ],
        ),
      ),
    );
  }
}
