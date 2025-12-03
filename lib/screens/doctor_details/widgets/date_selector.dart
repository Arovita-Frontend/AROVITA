import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateSelector extends StatelessWidget {
  final int daysCount;
  final DateTime? selectedDate;
  final void Function(DateTime) onSelectDate;

  const DateSelector({
    super.key,
    this.daysCount = 6,
    required this.selectedDate,
    required this.onSelectDate,
  });

  String _labelFor(DateTime d) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final candidate = DateTime(d.year, d.month, d.day);

    if (candidate == today) return "Today";
    if (candidate == today.add(const Duration(days: 1))) return "Tomorrow";

    // weekday name
    return DateFormat('EEE').format(d); // Mon, Tue ... (short)
  }

  String _dayNumber(DateTime d) {
    return DateFormat('dd MMM').format(d);
  }

  @override
  Widget build(BuildContext context) {
    final List<DateTime> days = List.generate(daysCount, (i) => DateTime.now().add(Duration(days: i)));

    return SizedBox(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: days.length,
        itemBuilder: (context, index) {
          final d = days[index];
          final bool isSelected = selectedDate != null &&
              DateTime(selectedDate!.year, selectedDate!.month, selectedDate!.day) ==
                  DateTime(d.year, d.month, d.day);
          return Padding(
            padding: EdgeInsets.only(left: index == 0 ? 0 : 8, right: 8),
            child: GestureDetector(
              onTap: () => onSelectDate(d),
              child: Container(
                width: 90,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.deepPurple : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: isSelected ? Colors.deepPurple : const Color(0xFFE7E6F3)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_labelFor(d),
                        style: TextStyle(color: isSelected ? Colors.white : Colors.grey, fontSize: 12)),
                    const SizedBox(height: 6),
                    Text(_dayNumber(d),
                        style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black87, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
