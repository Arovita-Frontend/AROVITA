import 'package:arovita/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'family_member_card.dart';
import 'add_member_card.dart';

class FamilyHealthSection extends StatelessWidget {
  const FamilyHealthSection({super.key});

  @override
  Widget build(BuildContext context) {
    final members = [
      ["John", "45", "120/80", "68", "assets/images/john.jpg"],
      ["Emma", "12", "120/80", "85", "assets/images/emma.jpg"],
    ];

    return LayoutBuilder(
      builder: (context, constraints) {

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Family health",
              style: TextStyle(
                fontSize: Responsive.desktopText18,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 16),

            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                ...members.map(
                  (m) => FamilyMemberCard(
                    name: m[0],
                    age: m[1],
                    bp: m[2],
                    hr: m[3],
                    imagePath: m[4],
                  ),
                ),
                const AddMemberCard(),
              ],
            ),
          ],
        );
      },
    );
  }
}