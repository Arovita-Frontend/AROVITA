import 'package:arovita/utils/responsive.dart';
import 'package:flutter/material.dart';

class DoctorProfilePopup extends StatelessWidget {
  final String name;
  final String field;
  final String imagePath;

  const DoctorProfilePopup({
    super.key,
    required this.name,
    required this.field,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: 320,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(blurRadius: 15, color: Colors.black.withOpacity(0.2)),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Close button (top-right)
              Align(
                alignment: Alignment.topRight,
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close, size: 22),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // Image
              CircleAvatar(radius: 45, backgroundImage: AssetImage(imagePath)),

              const SizedBox(height: 16),

              Text(
                name,
                style: TextStyle(
                  fontSize: Responsive.desktopText20,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 6),

              Text(
                field,
                style: TextStyle(fontSize: Responsive.desktopText16, color: Colors.grey),
              ),

              const SizedBox(height: 18),

              // Add any extra details here in future
              ElevatedButton(
                onPressed: () {},
                child: const Text("View Full Profile"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
