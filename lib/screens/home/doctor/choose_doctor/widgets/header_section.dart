import 'package:flutter/material.dart';
import '../../../../../utils/responsive.dart';

class HeaderSection extends StatelessWidget {
  final String title;
  final String subtitle;

  const HeaderSection({
    super.key,
    this.title = 'Choose Your Doctor',
    this.subtitle = 'Select from our verified specialists',
  });

  @override
  Widget build(BuildContext context) {
    final scale = Responsive.scaleFactor(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 26 * scale, vertical: 18 * scale),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
            icon: Icon(Icons.arrow_back),
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18 * scale,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4 * scale),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12 * scale,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),

          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}