import 'package:arovita/utils/responsive.dart';
import 'package:flutter/material.dart';

class AddMemberForm extends StatefulWidget {
  final Function(String name, String age, String bp, String hr) onSubmit;
  final VoidCallback onCancel;

  const AddMemberForm({
    super.key,
    required this.onSubmit,
    required this.onCancel,
  });

  @override
  State<AddMemberForm> createState() => _AddMemberFormState();
}

class _AddMemberFormState extends State<AddMemberForm> {
  final name = TextEditingController();
  final age = TextEditingController();
  final bp = TextEditingController();
  final hr = TextEditingController();

  String errorMessage = "";

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),

      title: Text(
        "Add Family Member",
        style: TextStyle(
          fontSize: Responsive.desktopText18,
          fontWeight: FontWeight.w600,
        ),
      ),

      content: SizedBox(
        width: Responsive.isMobile ? 280 : 350,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            // NAME
            TextField(
              controller: name,
              style: TextStyle(
                fontSize: Responsive.desktopText16,
              ),
              decoration: InputDecoration(
                labelText: "Name",
                labelStyle: TextStyle(
                  fontSize: Responsive.desktopText14,
                ),
              ),
            ),

            // AGE
            TextField(
              controller: age,
              style: TextStyle(
                fontSize: Responsive.desktopText16,
              ),
              decoration: InputDecoration(
                labelText: "Age",
                labelStyle: TextStyle(
                  fontSize: Responsive.desktopText14,
                ),
              ),
            ),

            // BLOOD PRESSURE
            TextField(
              controller: bp,
              style: TextStyle(
                fontSize: Responsive.desktopText16,
              ),
              decoration: InputDecoration(
                labelText: "Blood Pressure (e.g., 120/80)",
                labelStyle: TextStyle(
                  fontSize: Responsive.desktopText14,
                ),
              ),
            ),

            // HEART RATE
            TextField(
              controller: hr,
              style: TextStyle(
                fontSize: Responsive.desktopText16,
              ),
              decoration: InputDecoration(
                labelText: "BPM (Heart Rate)",
                labelStyle: TextStyle(
                  fontSize: Responsive.desktopText14,
                ),
              ),
            ),

            const SizedBox(height: 12),

            if (errorMessage.isNotEmpty)
              Text(
                errorMessage,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: Responsive.desktopText12,
                ),
              ),
          ],
        ),
      ),

      actionsPadding: EdgeInsets.symmetric(
        horizontal: Responsive.isMobile ? 8 : 16,
        vertical: Responsive.isMobile ? 5 : 10,
      ),

      actions: [
        TextButton(
          onPressed: widget.onCancel,
          child: Text(
            "Cancel",
            style: TextStyle(
              fontSize: Responsive.desktopText14,
            ),
          ),
        ),

        ElevatedButton(
          onPressed: () {
            if (name.text.trim().isEmpty) {
              setState(() => errorMessage = "Name is required");
              return;
            }

            if (age.text.trim().isEmpty) {
              setState(() => errorMessage = "Age is required");
              return;
            }

            if (int.tryParse(age.text.trim()) == null) {
              setState(() => errorMessage = "Age must be a valid number");
              return;
            }

            widget.onSubmit(
              name.text.trim(),
              age.text.trim(),
              bp.text.trim(),
              hr.text.trim(),
            );
          },
          child: Text(
            "Add Member",
            style: TextStyle(
              fontSize: Responsive.desktopText14,
            ),
          ),
        ),
      ],
    );
  }
}
