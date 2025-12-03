import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  final String name;
  final String subtitle;
  final String specialization;
  final bool isOnline;

  const DoctorCard({
    super.key,
    required this.name,
    required this.subtitle,
    required this.specialization,
    this.isOnline = false,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isMobile = width < 600;

    return Container(
      padding: EdgeInsets.all(isMobile ? 12 : 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Color(0x11000000), blurRadius: 8, offset: Offset(0,4))],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: isMobile ? 28 : 36,
            backgroundImage: const NetworkImage('https://i.pravatar.cc/150?img=47'),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(child: Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
                    if (isOnline)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFFDFF6E7),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text("Online Now", style: TextStyle(fontSize: 12, color: Color(0xFF227A3C))),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(height: 4),
                Text(specialization, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                Row(
                  children: const [
                    Icon(Icons.star, size: 14, color: Colors.orange),
                    SizedBox(width: 4),
                    Text("4.8 (500+ reviews)", style: TextStyle(fontSize: 12)),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
