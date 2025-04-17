import 'package:flutter/material.dart';

class Getotpbutton extends StatelessWidget {
  const Getotpbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/otpScreen');
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFF147C8C),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Get OTP',
                  style: TextStyle(fontSize: 16),
                ),
              ),
    );
  }
}
