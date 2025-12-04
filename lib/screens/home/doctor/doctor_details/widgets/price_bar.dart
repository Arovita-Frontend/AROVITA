import 'package:flutter/material.dart';

class PriceBarInline extends StatelessWidget {
  final double fee;
  final String duration;
  final VoidCallback onBookNow;
  final VoidCallback onScheduleLater;
  final bool isBookEnabled;

  const PriceBarInline({
    super.key,
    required this.fee,
    required this.duration,
    required this.onBookNow,
    required this.onScheduleLater,
    required this.isBookEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Text("₹${fee.toStringAsFixed(0)}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: const Color(0xFFE9F9F0), borderRadius: BorderRadius.circular(20)),
                  child: const Text("First session free", style: TextStyle(fontSize: 12, color: Color(0xFF208A43))),
                ),
                const SizedBox(width: 12),
                Text("Duration: $duration", style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          const SizedBox(width: 12),
          OutlinedButton(
            onPressed: onScheduleLater,
            child: const Text("Schedule Later"),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: isBookEnabled ? onBookNow : null,
            child: const Text("Book Now"),
          ),
        ],
      ),
    );
  }
}

class PriceBarBottom extends StatelessWidget {
  final String doctorName;
  final String consultationType;
  final DateTime date;
  final String time;
  final double fee;
  final VoidCallback onBookNow;
  final VoidCallback onScheduleLater;

  const PriceBarBottom({
    super.key,
    required this.doctorName,
    required this.consultationType,
    required this.date,
    required this.time,
    required this.fee,
    required this.onBookNow,
    required this.onScheduleLater,
  });

  @override
  Widget build(BuildContext context) {
    final String formattedDate =
        "${date.day}/${date.month}/${date.year}";

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x22000000),
            blurRadius: 6,
            offset: Offset(0, -2),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          /// -------- SUMMARY SECTION --------
          Text(
            doctorName,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 2),

          Text(
            "$consultationType • $formattedDate • $time",
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 10),

          /// -------- PRICE + BUTTONS --------
          Row(
            children: [
              /// PRICE LEFT
              Expanded(
                child: Text(
                  "₹${fee.toStringAsFixed(0)}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0xFF7B33FF),
                  ),
                ),
              ),

              /// BUTTONS RIGHT
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: onScheduleLater,
                        child: const Text("Schedule Later"),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: onBookNow,
                        child: const Text("Confirm Booking"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
