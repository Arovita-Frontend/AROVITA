import 'package:arovita/utils/responsive.dart';
import 'package:flutter/material.dart';

class EmergencyContactCard extends StatefulWidget {
  EmergencyContactCard({super.key});

  @override
  State<EmergencyContactCard> createState() => _EmergencyContactCardState();
}

class _EmergencyContactCardState extends State<EmergencyContactCard> {
  final List<String> relationships = [
    "Parent",
    "Spouse",
    "Sibling",
    "Friend",
    "Other",
  ];

  String selectedRelationship = "";     // Relationship selected
  late TextEditingController fullNameController;
  late TextEditingController phoneController;
  bool isConsentGiven = false;       // Consent checkbox state
  double paddingResponsive = Responsive.isMobile ? 3 : 20;

  @override
  void initState() {
    super.initState();
    // Initialize controllers
    fullNameController = TextEditingController();
    phoneController = TextEditingController();
  }

  bool isButtonEnabled() {
    // Button will be enabled if all required fields are filled and consent is given
    return fullNameController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        selectedRelationship.isNotEmpty &&
        isConsentGiven;
  }

  @override
  void dispose() {
    // Dispose the controllers when the widget is destroyed
    fullNameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final scale = width < 450 ? 0.90 : width < 800 ? 0.95 : 1.0;

    return Transform.scale(
      scale: scale,
      child: Container(
        padding: EdgeInsets.all(paddingResponsive),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Emergency Contacts",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "In case of a health emergency, we’ll reach these people first.",
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: width < 450 ? 13 : 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Full Name Field
                  Text(
                    "Full Name",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: width < 450 ? 14 : 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: fullNameController,
                    decoration: InputDecoration(
                      hintText: "Enter full name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onChanged: (_) => setState(() {}),
                  ),
                  const SizedBox(height: 20),

                  // Relationship Field
                  Text(
                    "Relationship",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: width < 450 ? 14 : 16,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: relationships.map((label) {
                      final bool isSelected = selectedRelationship == label;

                      return GestureDetector(
                        onTap: () {
                          setState(() => selectedRelationship = label);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 10),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color(0xFF7C3AED)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(999),
                            border: Border.all(
                              color: isSelected
                                  ? const Color(0xFF7C3AED)
                                  : const Color(0xFFE2E8F0),
                            ),
                          ),
                          child: Text(
                            label,
                            style: TextStyle(
                              color: isSelected
                                  ? Colors.white
                                  : const Color(0xff64748B),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),

                  // Phone Number Field
                  Text(
                    "Phone Number",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: width < 450 ? 14 : 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 14),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text("+91"),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            hintText: "Enter 10-digit number",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onChanged: (_) => setState(() {}),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Consent Checkbox
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    value: isConsentGiven,
                    onChanged: (bool? value) {
                      setState(() {
                        isConsentGiven = value ?? false;
                      });
                    },
                  ),
                  Expanded(
                    child: Text(
                      "I consent to Arovita contacting these people "
                      "in case of a health emergency.",
                      style: TextStyle(
                        fontSize: width < 450 ? 13 : 14,
                        color: Colors.grey[800],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: const Color(0xff7C3AED),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: isButtonEnabled()
                    ? () {
                        Navigator.pushReplacementNamed(context, "/home");
                      }
                    : null,
                child: Text(
                  "Save & Finish Setup",
                  style: TextStyle(
                    fontSize: width < 450 ? 15 : 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Skip Button
            Center(
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, "/home");
                  },
                  child: Text(
                    "Skip for now",
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}