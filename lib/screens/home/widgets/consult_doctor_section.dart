import 'package:flutter/material.dart';
import 'doctor_category_card.dart';
import 'doctor_info_card.dart';
import 'consult_button.dart';

class ConsultDoctorSection extends StatelessWidget {
  const ConsultDoctorSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 600;

    final doctors = [
      {
        "name": "Dr. Johnson",
        "field": "Cardiologist",
        "image": "assets/images/johnson.jpg",
      },
      {
        "name": "Dr. Smith",
        "field": "General Medicine",
        "image": "assets/images/smith.jpg",
      },
    ];

    return Container(
      constraints: const BoxConstraints(maxWidth: 1440),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Consult a Doctor",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1E293B),
            ),
          ),

          const SizedBox(height: 20),

          // Category Cards
          if (isMobile)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  DoctorCategoryCard(
                    label: "General",
                    iconPath: "",
                    isMobile: true,
                  ),
                  const SizedBox(width: 12),
                  DoctorCategoryCard(
                    label: "Cardio",
                    iconPath: "",
                    isMobile: true,
                  ),
                  const SizedBox(width: 12),
                  DoctorCategoryCard(
                    label: "Neuro",
                    iconPath: "",
                    isMobile: true,
                  ),
                  const SizedBox(width: 12),
                  DoctorCategoryCard(
                    label: "Skin",
                    iconPath: "",
                    isMobile: true,
                  ),
                ],
              ),
            )
          else
            Row(
              children: const [
                DoctorCategoryCard(
                  label: "General",
                  iconPath: "assets/images/general.png",
                  isMobile: false,
                ),
                SizedBox(width: 20),
                DoctorCategoryCard(
                  label: "Cardio",
                  iconPath: "assets/images/cardio.png",
                  isMobile: false,
                ),
                SizedBox(width: 20),
                DoctorCategoryCard(
                  label: "Neuro",
                  iconPath: "assets/images/neuro.png",
                  isMobile: false,
                ),
                SizedBox(width: 20),
                DoctorCategoryCard(
                  label: "Skin",
                  iconPath: "assets/images/skin.png",
                  isMobile: false,
                ),
              ],
            ),

          const SizedBox(height: 24),

          LayoutBuilder(
            builder: (context, constraints) {
              final double maxWidth = constraints.maxWidth;

              double cardWidth;
              if (isMobile) {
                cardWidth = 335;
              } else if (maxWidth < 900) {
                cardWidth = maxWidth / 1;
              } else {
                cardWidth = (maxWidth / 2) - 20;
              }

              return Wrap(
                spacing: 22,
                runSpacing: 16,
                children: doctors.map((doctor) {
                  return DoctorInfoCard(
                    name: doctor["name"]!,
                    field: doctor["field"]!,
                    imagePath: doctor["image"]!,
                    isMobile: isMobile,
                    width: cardWidth+3,
                  );
                }).toList(),
              );
            },
          ),

          const SizedBox(height: 16),
          ConsultButton(isMobile: isMobile),
        ],
      ),
    );
  }
}
