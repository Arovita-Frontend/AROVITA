import 'package:arovita/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'family_member_card.dart';
import 'add_member_card.dart';
import 'family_member_detail_card.dart';
import 'add_member_form.dart';

class FamilyHealthSection extends StatefulWidget {
  const FamilyHealthSection({super.key});

  @override
  State<FamilyHealthSection> createState() => _FamilyHealthSectionState();
}

class _FamilyHealthSectionState extends State<FamilyHealthSection> {
  List<List<String>> members = [
    ["John", "45", "120/80", "68", "assets/images/john.jpg"],
    ["Emma", "12", "120/80", "85", "assets/images/emma.jpg"],
  ];

  void _openMemberDetailPopup(int index) {
    final m = members[index];

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return FamilyMemberDetailCard(
          name: m[0],
          age: m[1],
          bp: m[2],
          hr: m[3],
          imagePath: m[4],

          onClose: () => Navigator.pop(context),

          onDelete: () {
            setState(() {
              members.removeAt(index);
            });
            Navigator.pop(context); // close popup
          },
        );
      },
    );
  }

  void _openAddMemberForm() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AddMemberForm(
          onCancel: () => Navigator.pop(context),

          onSubmit: (name, age, bp, hr) {
            setState(() {
              members.add([
                name,
                age,
                bp,
                hr,
                "assets/images/default_user.jpg",
              ]);
            });

            Navigator.pop(context);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
            ...members.asMap().entries.map((entry) {
              final index = entry.key;
              final m = entry.value;

              return FamilyMemberCard(
                name: m[0],
                age: m[1],
                bp: m[2],
                hr: m[3],
                imagePath: m[4],
                onTap: () => _openMemberDetailPopup(
                  index,
                ),
              );
            }),

            // CLICKABLE Add button
            AddMemberCard(onTap: _openAddMemberForm),
          ],
        ),
      ],
    );
  }
}
