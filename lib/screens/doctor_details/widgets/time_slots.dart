// import 'package:flutter/material.dart';

// class TimeSlots extends StatelessWidget {
//   final String? selectedTime;
//   final void Function(String) onSelectTime;

//   const TimeSlots({
//     super.key,
//     required this.selectedTime,
//     required this.onSelectTime,
//   });

//   Widget _buildSlot(BuildContext context, String time, bool disabled) {
//     final bool isSelected = selectedTime == time;
//     return GestureDetector(
//       onTap: disabled ? null : () => onSelectTime(time),
//       child: Container(
//         width: 110,
//         height: 42,
//         margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
//         decoration: BoxDecoration(
//           color: disabled ? const Color(0xFFF0EFF6) : (isSelected ? Colors.deepPurple : Colors.white),
//           borderRadius: BorderRadius.circular(8),
//           border: Border.all(color: disabled ? const Color(0xFFE7E6F3) : const Color(0xFFE7E6F3)),
//         ),
//         child: Center(
//           child: Text(
//             time,
//             style: TextStyle(
//               color: disabled ? Colors.grey : (isSelected ? Colors.white : Colors.black87),
//               fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Example times, grouped. Replace with dynamic data if required.
//     final morning = ['09:00 AM', '09:30 AM', '10:30 AM', '11:00 AM'];
//     final afternoon = ['02:00 PM', '02:30 PM', '03:00 PM', '03:30 PM'];
//     final evening = ['05:00 PM', '05:30 PM', '06:00 PM', '06:30 PM'];

//     // Example disabled flags for some times (last entry in each row disabled)
//     return Container(
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text("Morning", style: TextStyle(fontWeight: FontWeight.w600)),
//           const SizedBox(height: 8),
//           Wrap(
//             children: morning
//                 .map((t) => _buildSlot(context, t, t.endsWith("00") && t.startsWith('11'))) // small example disable
//                 .toList(),
//           ),
//           const SizedBox(height: 6),
//           const Text("Afternoon", style: TextStyle(fontWeight: FontWeight.w600)),
//           const SizedBox(height: 8),
//           Wrap(
//             children: afternoon.map((t) => _buildSlot(context, t, t == '03:30 PM')).toList(),
//           ),
//           const SizedBox(height: 6),
//           const Text("Evening", style: TextStyle(fontWeight: FontWeight.w600)),
//           const SizedBox(height: 8),
//           Wrap(
//             children: evening.map((t) => _buildSlot(context, t, t == '06:30 PM')).toList(),
//           ),
//         ],
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';

class TimeSlots extends StatelessWidget {
  final String? selectedTime;
  final void Function(String) onSelectTime;

  const TimeSlots({
    super.key,
    required this.selectedTime,
    required this.onSelectTime,
  });

  // ----- Each slot widget -----
  Widget _slot(BuildContext context, String time, bool disabled) {
    final bool isSelected = selectedTime == time;

    return Container(
      height: 42,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: disabled
            ? const Color(0xFFF0EFF6)
            : (isSelected ? Colors.deepPurple : Colors.white),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: disabled ? const Color(0xFFE7E6F3) : const Color(0xFFE7E6F3),
        ),
      ),
      child: Text(
        time,
        style: TextStyle(
          color: disabled
              ? Colors.grey
              : (isSelected ? Colors.white : Colors.black87),
          fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
        ),
      ),
    );
  }

  // ----- ROW THAT ADAPTS FULL WIDTH & WRAPS ONLY IF TOO SMALL -----
  Widget _responsiveRow(
    BuildContext context,
    List<String> times,
    String? disabledTime,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double maxW = constraints.maxWidth;

        // WIDTH BREAKPOINTS  
        bool isLarge = maxW > 900;    // desktop  
        bool isMedium = maxW > 600;   // tablet  
        bool isSmall = maxW <= 600;   // mobile  

        // ---- DESKTOP (one full-width row, even spacing) ----
        if (isLarge) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: times.map((t) {
              bool disabled = t == disabledTime;
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: GestureDetector(
                    onTap: disabled ? null : () => onSelectTime(t),
                    child: _slot(context, t, disabled),
                  ),
                ),
              );
            }).toList(),
          );
        }

        // ---- TABLET (2 items per row, fills width evenly) ----
        if (isMedium) {
          int columns = 2;
          double itemWidth = (maxW - 12) / 2;

          return Wrap(
            spacing: 12,
            runSpacing: 12,
            children: times.map((t) {
              bool disabled = t == disabledTime;
              return SizedBox(
                width: itemWidth,
                child: GestureDetector(
                  onTap: disabled ? null : () => onSelectTime(t),
                  child: _slot(context, t, disabled),
                ),
              );
            }).toList(),
          );
        }

        // ---- MOBILE (buttons shrink until a minimum width, then wrap) ----
        return Wrap(
          spacing: 12,
          runSpacing: 12,
          children: times.map((t) {
            bool disabled = t == disabledTime;
            return LayoutBuilder(
              builder: (context, c) {
                return ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: 140),
                  child: IntrinsicWidth(
                    child: GestureDetector(
                      onTap: disabled ? null : () => onSelectTime(t),
                      child: _slot(context, t, disabled),
                    ),
                  ),
                );
              },
            );
          }).toList(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final morning = ['09:00 AM', '09:30 AM', '10:30 AM', '11:00 AM'];
    final afternoon = ['02:00 PM', '02:30 PM', '03:00 PM', '03:30 PM'];
    final evening = ['05:00 PM', '05:30 PM', '06:00 PM', '06:30 PM'];

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Morning", style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 10),
          _responsiveRow(context, morning, '11:00 AM'),

          const SizedBox(height: 20),
          const Text("Afternoon", style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 10),
          _responsiveRow(context, afternoon, '03:30 PM'),

          const SizedBox(height: 20),
          const Text("Evening", style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 10),
          _responsiveRow(context, evening, '06:30 PM'),
        ],
      ),
    );
  }
}
