import 'package:flutter/material.dart';
import 'otp_verification_card.dart';

class OtpScreen extends StatelessWidget {
  final String phoneOrEmail;

  const OtpScreen({super.key, required this.phoneOrEmail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      body: SafeArea(
        child: Center(
          child: OtpVerificationCard(
            phoneNumber: phoneOrEmail,
            onVerify: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/home',
                (_) => false,
              );
            },
            onChangeNumber: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}