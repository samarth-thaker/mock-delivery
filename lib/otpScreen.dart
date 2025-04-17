import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Otpscreen extends StatefulWidget {
  const Otpscreen({super.key});

  @override
  State<Otpscreen> createState() => _OtpscreenState();
}

class _OtpscreenState extends State<Otpscreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final boxWidth = (screenWidth - 64) / 6;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Enter OTP"),
        backgroundColor: const Color(0xFF147C8C),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Form(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(6, (index) {
                  return SizedBox(
                    width: boxWidth,
                    height: 56,
                    child: TextFormField(
                      onChanged: (value) {
                        if (value.length == 1 && index != 5) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      keyboardType: TextInputType.number,
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.teal),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Color(0xFF147C8C),
                            width: 2,
                          ),
                        ),
                      ),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  );
                }),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () => {},
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all(Colors.transparent),
                    side: WidgetStateProperty.all(
                      BorderSide(color: Color(0xFF147C8C), width: 1.5),
                    ),
                  ),
                  child: Text('Resend OTP'),
                ),
                TextButton(
                  onPressed: () => {
                    Navigator.pushNamed(context, '/dashboardScreen'),
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Color(0xFF147C8C)),
                  ),
                  child: Text('Confirm OTP',
                      style: TextStyle(color: Colors.white)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
