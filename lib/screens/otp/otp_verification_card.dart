import 'package:flutter/material.dart';
import '../../utils/responsive.dart';

class OtpVerificationCard extends StatefulWidget {
  final String phoneNumber;
  final VoidCallback? onChangeNumber;
  final VoidCallback? onVerify;

  const OtpVerificationCard({
    super.key,
    required this.phoneNumber,
    this.onChangeNumber,
    this.onVerify,
  });

  @override
  State<OtpVerificationCard> createState() => _OtpVerificationCardState();
}

class _OtpVerificationCardState extends State<OtpVerificationCard> {
  final List<TextEditingController> _otpControllers =
      List.generate(4, (_) => TextEditingController());

  bool isOtpComplete = false;

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);

    // RESPONSIVE SIZES
    double cardWidth = Responsive.isDesktop
        ? 384
        : (Responsive.width * 0.9).clamp(300, 384);

    double? cardHeight = Responsive.isDesktop ? 540 : null;
    double cardPadding = Responsive.isDesktop ? 32 : 20;

    double otpBoxWidth = Responsive.isDesktop ? 44 : 38;
    double otpBoxHeight = Responsive.isDesktop ? 52 : 45;
    double otpBoxGap = Responsive.isDesktop ? 6 : 4;

    double buttonWidth = Responsive.isDesktop ? 320 : Responsive.width * 0.75;

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color(0xFFF8FAFC),
      child: Center(
        child: Container(
          width: cardWidth,
          height: cardHeight,
          padding: EdgeInsets.all(cardPadding),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // FIRST SECTION
              Column(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0x1A0091FF),
                    ),
                    child: Icon(
                      Icons.security,
                      size: Responsive.floatingIconSize,
                      color: const Color(0xFF0091FF),
                    ),
                  ),

                  const SizedBox(height: 24),

                  Text(
                    "Enter Verification Code",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: Responsive.desktopText20,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF1E293B),
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    "A 4-digit code was sent to your phone",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: Responsive.desktopText14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF64748B),
                    ),
                  ),

                  const SizedBox(height: 16),

                  Column(
                    children: [
                      Text(
                        widget.phoneNumber,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: Responsive.desktopText14,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF1E293B),
                        ),
                      ),

                      const SizedBox(height: 4),

                      GestureDetector(
                        onTap: widget.onChangeNumber,
                        child: Text(
                          "Change",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: Responsive.desktopText14,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF0091FF),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),

              const SizedBox(height: 40),

              // OTP BOXES
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: otpBoxGap),
                    child: Container(
                      width: otpBoxWidth,
                      height: otpBoxHeight,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: const Color(0xFFE2E8F0)),
                      ),
                      child: TextField(
                        controller: _otpControllers[index],
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: Responsive.desktopText16,
                          fontWeight: FontWeight.w600,
                        ),
                        decoration: const InputDecoration(
                          counterText: "",
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          if (value.length == 1 && index < 3) {
                            FocusScope.of(context).nextFocus();
                          }

                          // UPDATE BUTTON STATE
                          setState(() {
                            isOtpComplete = _otpControllers
                                .every((c) => c.text.isNotEmpty);
                          });
                        },
                      ),
                    ),
                  );
                }),
              ),

              const SizedBox(height: 24),

              // RESEND LINE
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Didn't get the code?  ",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: Responsive.desktopText14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF64748B),
                      ),
                    ),
                    TextSpan(
                      text: "Resend in 00:26",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: Responsive.desktopText14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF0091FF),
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 32),

              // VERIFY BUTTON
              GestureDetector(
                onTap: isOtpComplete ? widget.onVerify : null,
                child: Container(
                  width: buttonWidth,
                  height: Responsive.buttonHeight + 6,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isOtpComplete
                        ? const Color(0xFF0091FF)
                        : const Color(0xFF94A3B8),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "Verify & Continue",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: Responsive.desktopText16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              Text(
                "Having trouble?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: Responsive.desktopText12,
                  color: const Color(0xFF64748B),
                ),
              ),

              const SizedBox(height: 4),

              Text(
                "Contact Support",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: Responsive.desktopText16,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF0091FF),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
