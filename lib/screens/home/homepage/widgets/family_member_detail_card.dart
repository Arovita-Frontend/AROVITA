import 'package:arovita/utils/responsive.dart';
import 'package:flutter/material.dart';

class FamilyMemberDetailCard extends StatelessWidget {
  final String name;
  final String age;
  final String bp;
  final String hr;
  final String imagePath;

  final VoidCallback onDelete;
  final VoidCallback onClose;

  const FamilyMemberDetailCard({
    super.key,
    required this.name,
    required this.age,
    required this.bp,
    required this.hr,
    required this.imagePath,
    required this.onDelete,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile;
    final double popupWidth = isMobile ? 280 : 350;

    final double avatarRadius = isMobile ? 40 : 55;
    final double paddingValue = isMobile ? 8 : 16;
    final double buttonHeight = isMobile ? 36 : 45;
    final double verticalSpace = isMobile ? 15 : 20;

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      contentPadding: EdgeInsets.zero,

      content: Container(
        width: popupWidth,
        padding: EdgeInsets.all(paddingValue),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // CLOSE BUTTON
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: onClose,
              ),
            ),

            // PROFILE IMAGE
            CircleAvatar(
              radius: avatarRadius,
              backgroundImage: AssetImage(imagePath),
            ),

            const SizedBox(height: 12),

            // NAME
            Text(
              name,
              style: TextStyle(
                fontSize: Responsive.desktopText20,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 6),

            // RESPONSIVE DETAILS
            Text(
              "Age: $age",
              style: TextStyle(fontSize: Responsive.desktopText14),
            ),
            Text(
              "Blood Pressure: $bp",
              style: TextStyle(fontSize: Responsive.desktopText14),
            ),
            Text(
              "Heart Rate: $hr BPM",
              style: TextStyle(fontSize: Responsive.desktopText14),
            ),

            SizedBox(height: verticalSpace),

            // DELETE BUTTON
            SizedBox(
              width: double.infinity,
              height: buttonHeight,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(fontSize: Responsive.desktopText14),
                ),
                icon: const Icon(Icons.delete),
                label: const Text("Delete Member"),
                onPressed: onDelete,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
