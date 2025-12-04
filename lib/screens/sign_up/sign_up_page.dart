import 'package:flutter/material.dart';
import '../../utils/responsive.dart';
import '../../utils/country_code_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController firstNameCtrl = TextEditingController();
  final TextEditingController secondNameCtrl = TextEditingController();
  final TextEditingController ageCtrl = TextEditingController();
  final TextEditingController phoneCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();

  String? gender;
  CountryCode? selectedCountry;

  bool get isPhoneValid => phoneCtrl.text.trim().length >= 10;

  @override
  void initState() {
    super.initState();
    selectedCountry = countryCodes.first;

    phoneCtrl.addListener(() {
      setState(() {}); // updates verify OTP button state
    });
  }

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);
    double scale = Responsive.scaleFactor(context);

    double cardWidth = Responsive.isDesktop
        ? 480
        : Responsive.isTablet
        ? 420
        : 360;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Container(
            width: cardWidth,
            padding: EdgeInsets.symmetric(
              vertical: 20 * scale,
              horizontal: 18 * scale,
            ),
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo
                Image.asset(
                  "assets/images/ArovitaLOGO.png",
                  width: Responsive.isDesktop ? 120 : 97,
                ),

                const SizedBox(height: 10),
                Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: Responsive.desktopText30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 30),

                // Row 1 — First / Second Name
                Row(
                  children: [
                    Expanded(child: _inputField("First name", firstNameCtrl)),
                    const SizedBox(width: 12),
                    Expanded(child: _inputField("Second name", secondNameCtrl)),
                  ],
                ),

                const SizedBox(height: 18),

                // Row 2 — Age / Gender
                Row(
                  children: [
                    Expanded(
                      child: _inputField(
                        "Age",
                        ageCtrl,
                        inputType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(child: _genderDropdown(scale)),
                  ],
                ),

                const SizedBox(height: 18),

                // Row 3 — Country Code + Phone
                Row(
                  children: [
                    CountryCodePicker(
                      scale: scale,
                      initialSelection: selectedCountry,
                      onChanged: (value) {
                        setState(() => selectedCountry = value);
                      },
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _inputField(
                        "Phone",
                        phoneCtrl,
                        inputType: TextInputType.phone,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 18),

                // Email
                _inputField(
                  "Email",
                  emailCtrl,
                  inputType: TextInputType.emailAddress,
                ),

                const SizedBox(height: 22),

                // Verify OTP Button
                SizedBox(
                  width: double.infinity,
                  height: Responsive.buttonHeight,
                  child: ElevatedButton(
                    onPressed: isPhoneValid ? () {} : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isPhoneValid
                          ? const Color(0xFF2E4D2E)
                          : const Color(0xFFE1E4E1),
                      foregroundColor: Colors.white,
                      disabledForegroundColor: Colors.white,
                      disabledBackgroundColor: const Color(0xFFE9ECE9),
                    ),
                    child: Text(
                      "Verify using OTP",
                      style: TextStyle(fontSize: Responsive.desktopText16),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                // Divider
                Divider(color: Colors.grey.shade300, thickness: 1),

                const SizedBox(height: 18),

                // Google Sign Up Button
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
                          "Sign up with Google",
                          style: TextStyle(
                            fontSize: Responsive.desktopText16,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                // Login link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(fontSize: Responsive.desktopText14),
                    ),

                    // CLICKABLE LOGIN TEXT WITH HAND CURSOR
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/login");
                        },
                        child: Text(
                          "Log In",
                          style: TextStyle(
                            fontSize: Responsive.desktopText14,
                            color: Colors.lightBlue[700],
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ------------ Input Field Reusable ------------
  Widget _inputField(
    String hint,
    TextEditingController controller, {
    TextInputType inputType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
      style: TextStyle(fontSize: Responsive.desktopText16),
      decoration: InputDecoration(
        labelText: hint,
        labelStyle: TextStyle(fontSize: Responsive.desktopText14),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }

  // ------------ Gender Dropdown ------------
  Widget _genderDropdown(double scale) {
    return DropdownButtonFormField<String>(
      value: gender,
      items: const [
        DropdownMenuItem(value: "Female", child: Text("Female")),
        DropdownMenuItem(value: "Male", child: Text("Male")),
        DropdownMenuItem(value: "Others", child: Text("Others")),
      ],
      onChanged: (value) => setState(() => gender = value),
      decoration: const InputDecoration(
        labelText: "Gender",
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
