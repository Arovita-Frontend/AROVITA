import 'dart:async';
import 'package:flutter/material.dart';
import '../../utils/responsive.dart';
import '../../utils/country_code_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  bool isPhoneEntered = false;

  // OTP timer variables
  bool showOtpTimer = false;
  int remainingSeconds = 120;
  Timer? countdownTimer;

  @override
  void initState() {
    super.initState();

    phoneController.addListener(() {
      setState(() {
        isPhoneEntered = phoneController.text.trim().length >= 10;
      });
    });

    // 🔥 When OTP becomes 6 digits → navigate to /home
    otpController.addListener(() {
      if (otpController.text.trim().length == 6) {
        Navigator.pushReplacementNamed(context, "/home");
      }
    });
  }

  void startOtpTimer() {
    setState(() {
      showOtpTimer = true;
      remainingSeconds = 120;
    });

    countdownTimer?.cancel(); // clear old timer

    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds == 0) {
        timer.cancel();
        setState(() {});
      } else {
        setState(() {
          remainingSeconds--;
        });
      }
    });
  }

  String get formattedTime {
    int minutes = remainingSeconds ~/ 60;
    int seconds = remainingSeconds % 60;
    return "$minutes:${seconds.toString().padLeft(2, '0')}";
  }

  @override
  void dispose() {
    countdownTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);
    double scale = Responsive.scaleFactor(context);

    double cardWidth = Responsive.isDesktop
        ? Responsive.width * 0.32
        : Responsive.isTablet
        ? Responsive.width * 0.48
        : Responsive.width * 0.90;

    double horizontalPadding = Responsive.isDesktop
        ? 40 * scale
        : Responsive.isTablet
        ? 32 * scale
        : 20 * scale;

    double verticalPadding = Responsive.isDesktop
        ? 45 * scale
        : Responsive.isTablet
        ? 35 * scale
        : 25 * scale;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: cardWidth,
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: verticalPadding,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 12,
                  spreadRadius: 1,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // LOGO
                Image.asset(
                  "assets/images/ArovitaLOGO.png",
                  width: Responsive.isDesktop ? 120 : 100,
                ),

                SizedBox(height: 10),

                // TITLE
                Text(
                  "Log In",
                  style: TextStyle(
                    fontSize: Responsive.desktopText30,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: 28 * scale),

                // PHONE INPUT
                Container(
                  padding: const EdgeInsets.only(bottom: 4),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey, width: 1),
                    ),
                  ),
                  child: Row(
                    children: [
                      // Country Picker
                      CountryCodePicker(
                        scale: scale,
                        initialSelection: countryCodes.first,
                        onChanged: (selectedCountry) {},
                      ),

                      // Vertical Divider
                      Container(
                        height: 20,
                        width: 1,
                        color: Colors.grey.shade400,
                        margin: EdgeInsets.symmetric(horizontal: 10 * scale),
                      ),

                      // Phone Field
                      Expanded(
                        child: TextField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          maxLength: 10,
                          decoration: const InputDecoration(
                            counterText: "",
                            hintText: "Phone",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 18 * scale),

                // OTP INPUT
                TextField(
                  controller: otpController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: "Enter OTP",
                    border: UnderlineInputBorder(),
                  ),
                ),

                SizedBox(height: 25 * scale),

                // GENERATE OTP BUTTON
                SizedBox(
                  width: double.infinity,
                  height: Responsive.buttonHeight + 8,
                  child: ElevatedButton(
                    onPressed: isPhoneEntered ? () => startOtpTimer() : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isPhoneEntered
                          ? const Color(0xFF2E4D2E)
                          : Colors.grey.shade300,
                      disabledBackgroundColor: Colors.grey.shade300,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      "Generate OTP",
                      style: TextStyle(
                        color: isPhoneEntered
                            ? Colors.white
                            : Colors.grey.shade600,
                        fontSize: Responsive.desktopText16,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 25 * scale),

                Divider(thickness: 1, color: Colors.grey.shade300),
                SizedBox(height: 20 * scale),

                // GOOGLE BUTTON
                SizedBox(
                  width: double.infinity,
                  height: Responsive.buttonHeight + 8,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.grey.shade400),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.google,
                          size: 20,
                          color: Colors.black,
                        ),
                        SizedBox(width: 10 * scale),
                        Text(
                          "Log in with Google",
                          style: TextStyle(
                            fontSize: Responsive.desktopText16,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 25 * scale),

                // RESEND OTP TIMER
                if (showOtpTimer)
                  Column(
                    children: [
                      MouseRegion(
                        cursor: remainingSeconds == 0
                            ? SystemMouseCursors.click
                            : SystemMouseCursors
                                  .basic, // Normal cursor when not clickable
                        child: GestureDetector(
                          onTap: remainingSeconds == 0
                              ? () => startOtpTimer()
                              : null,
                          child: RichText(
                            text: TextSpan(
                              children: remainingSeconds == 0
                                  ? [
                                      // -------- Resend OTP (Clickable) --------
                                      TextSpan(
                                        text: "Resend OTP",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: Responsive.desktopText14,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ]
                                  : [
                                      // -------- Resend OTP (non-clickable) --------
                                      TextSpan(
                                        text: "Resend OTP in ",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: Responsive.desktopText14,
                                        ),
                                      ),

                                      // -------- TIMER (blue) --------
                                      TextSpan(
                                        text: formattedTime,
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: Responsive.desktopText14,
                                        ),
                                      ),
                                    ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20 * scale),
                    ],
                  ),

                // SIGN UP TEXT
                RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: Responsive.desktopText14,
                    ),
                    children: [
                      WidgetSpan(
                        child: MouseRegion(
                          cursor:
                              SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                "/sign_up",
                              );
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: Responsive.desktopText14,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10 * scale),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
