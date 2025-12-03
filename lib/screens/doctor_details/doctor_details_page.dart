// import 'package:flutter/material.dart';
// import 'widgets/header.dart';
// import 'widgets/doctor_card.dart';
// import 'widgets/about_section.dart';
// import 'widgets/consultation_type.dart';
// import 'widgets/date_selector.dart';
// import 'widgets/time_slots.dart';
// import 'widgets/price_bar.dart';
// import '../../models/consultation_type.dart';

// class DoctorDetailsPage extends StatefulWidget {
//   const DoctorDetailsPage({super.key});

//   @override
//   State<DoctorDetailsPage> createState() => _DoctorDetailsPageState();
// }

// class _DoctorDetailsPageState extends State<DoctorDetailsPage> {
//   ConsultationType? _selectedConsultation;
//   DateTime? _selectedDate;
//   String? _selectedTime;

//   // Example doctor info (you can replace with model)
//   final String doctorName = "Dr. Aisha Verma";
//   final String subtitle = "MBBS, MD (Dermatology)";
//   final String specialization = "Dermatologist";
//   final double fee = 499.0;
//   final String duration = "15 minutes";

//   void _onSelectConsultation(ConsultationType type) {
//     setState(() {
//       _selectedConsultation = type;
//     });
//   }

//   void _onSelectDate(DateTime date) {
//     setState(() {
//       _selectedDate = date;
//       _selectedTime = null; // clear time when date changes
//     });
//   }

//   void _onSelectTime(String time) {
//     setState(() {
//       _selectedTime = time;
//     });
//   }

//   void _onBookNow() {
//     // handle booking
//     final type = _selectedConsultation?.name ?? 'none';
//     final dateStr = _selectedDate?.toIso8601String() ?? 'none';
//     final time = _selectedTime ?? 'none';
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Booking -> $type | $dateStr | $time')),
//     );
//   }

//   void _onScheduleLater() {
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('Schedule later tapped')),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final bool isMobile = width < 600;

//     final pageContent = Padding(
//       padding: EdgeInsets.symmetric(horizontal: isMobile ? 12 : 40, vertical: 16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Header(
//             title: "Doctor Details",
//             onBack: () => Navigator.of(context).maybePop(),
//             onShare: () {},
//           ),
//           const SizedBox(height: 12),
//           DoctorCard(
//             name: doctorName,
//             subtitle: subtitle,
//             specialization: specialization,
//             isOnline: true,
//           ),
//           const SizedBox(height: 16),
//           AboutSection(
//             about:
//                 "Dr. Verma has over 10 years of experience treating skin and hair conditions. She's passionate about preventive dermatology and holistic care. Her approach combines evidence-based medicine with personalized treatment plans.",
//           ),
//           const SizedBox(height: 20),
//           const Text("Choose Consultation Type", style: TextStyle(fontWeight: FontWeight.w600)),
//           const SizedBox(height: 8),
//           ConsultationTypeSelector(
//             selected: _selectedConsultation,
//             onSelect: _onSelectConsultation,
//           ),
//           const SizedBox(height: 20),
//           const Text("Available Slots", style: TextStyle(fontWeight: FontWeight.w600)),
//           const SizedBox(height: 8),
//           DateSelector(
//             daysCount: 6,
//             selectedDate: _selectedDate,
//             onSelectDate: _onSelectDate,
//           ),
//           const SizedBox(height: 12),
//           TimeSlots(
//             selectedTime: _selectedTime,
//             onSelectTime: _onSelectTime,
//           ),
//           const SizedBox(height: 24),

//           // For larger screens show the price & actions inline (so they scroll with parent)
//           if (!isMobile)
//             PriceBarInline(
//               fee: fee,
//               duration: duration,
//               onBookNow: _onBookNow,
//               onScheduleLater: _onScheduleLater,
//               isBookEnabled: _selectedConsultation != null && _selectedDate != null && _selectedTime != null,
//             ),

//           const SizedBox(height: 30), // spacing for bottom bar on larger screens
//         ],
//       ),
//     );

//     return Scaffold(
//       backgroundColor: const Color(0xFFF6F4FB),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           physics: const BouncingScrollPhysics(),
//           child: pageContent,
//         ),
//       ),
//       // On mobile show a fixed bottom bar with price & actions
//       bottomNavigationBar: (MediaQuery.of(context).size.width < 600)
//           ? PriceBarBottom(
//               fee: fee,
//               duration: duration,
//               onBookNow: _onBookNow,
//               onScheduleLater: _onScheduleLater,
//               isBookEnabled: _selectedConsultation != null && _selectedDate != null && _selectedTime != null,
//               selectedSummary:
//                   _selectedConsultation == null ? null : "${_selectedConsultation!.label} • ${_selectedTime ?? ''}",
//             )
//           : null,
//     );
//   }
// }







import 'package:flutter/material.dart';
import 'widgets/header.dart';
import 'widgets/doctor_card.dart';
import 'widgets/about_section.dart';
import 'widgets/consultation_type.dart';
import 'widgets/date_selector.dart';
import 'widgets/time_slots.dart';
import 'widgets/price_bar.dart';
import '../../models/consultation_type.dart';

class DoctorDetailsPage extends StatefulWidget {
  const DoctorDetailsPage({super.key});

  @override
  State<DoctorDetailsPage> createState() => _DoctorDetailsPageState();
}

class _DoctorDetailsPageState extends State<DoctorDetailsPage> {
  ConsultationType? _selectedConsultation;
  DateTime? _selectedDate;
  String? _selectedTime;

  final String doctorName = "Dr. Aisha Verma";
  final String subtitle = "MBBS, MD (Dermatology)";
  final String specialization = "Dermatologist";
  final double fee = 499.0;
  final String duration = "15 minutes";

  void _onSelectConsultation(ConsultationType type) {
    setState(() {
      _selectedConsultation = type;
    });
  }

  void _onSelectDate(DateTime date) {
    setState(() {
      _selectedDate = date;
      _selectedTime = null;
    });
  }

  void _onSelectTime(String time) {
    setState(() {
      _selectedTime = time;
    });
  }

  void _onBookNow() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Booking -> $_selectedConsultation | $_selectedDate | $_selectedTime')),
    );
  }

  void _onScheduleLater() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Schedule later tapped')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isMobile = width < 600;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F4FB),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Align(
            alignment: Alignment.topCenter,

            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 12 : 24,
                  vertical: 16,
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Header(
                      title: "Doctor Details",
                      onBack: () => Navigator.of(context).maybePop(),
                      onShare: () {},
                    ),
                    const SizedBox(height: 12),

                    DoctorCard(
                      name: doctorName,
                      subtitle: subtitle,
                      specialization: specialization,
                      isOnline: true,
                    ),
                    const SizedBox(height: 16),

                    AboutSection(
                      about:
                          "Dr. Verma has over 10 years of experience treating skin and hair conditions. She's passionate about preventive dermatology and holistic care. Her approach combines evidence-based medicine with personalized treatment plans.",
                    ),
                    const SizedBox(height: 20),

                    const Text("Choose Consultation Type",
                        style: TextStyle(fontWeight: FontWeight.w600)),
                    const SizedBox(height: 8),

                    ConsultationTypeSelector(
                      selected: _selectedConsultation,
                      onSelect: _onSelectConsultation,
                    ),
                    const SizedBox(height: 20),

                    const Text("Available Slots",
                        style: TextStyle(fontWeight: FontWeight.w600)),
                    const SizedBox(height: 8),

                    DateSelector(
                      daysCount: 6,
                      selectedDate: _selectedDate,
                      onSelectDate: _onSelectDate,
                    ),
                    const SizedBox(height: 12),

                    TimeSlots(
                      selectedTime: _selectedTime,
                      onSelectTime: _onSelectTime,
                    ),

                    const SizedBox(height: 24),

                    if (!isMobile)
                      PriceBarInline(
                        fee: fee,
                        duration: duration,
                        onBookNow: _onBookNow,
                        onScheduleLater: _onScheduleLater,
                        isBookEnabled: _selectedConsultation != null &&
                            _selectedDate != null &&
                            _selectedTime != null,
                      ),

                    const SizedBox(height: 30),

                    // ------------------------------------
                    // 🔥 KEY FIX: extra bottom padding for mobile
                    // ------------------------------------
                    SizedBox(height: isMobile ? 140 : 0),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),

      bottomNavigationBar: isMobile &&
        _selectedConsultation != null &&
        _selectedDate != null &&
        _selectedTime != null
    ? PriceBarBottom(
        doctorName: doctorName,
        consultationType: _selectedConsultation!.label,
        date: _selectedDate!,
        time: _selectedTime!,
        fee: fee,
        onBookNow: _onBookNow,
        onScheduleLater: _onScheduleLater,
      )
    : null,

    );
  }
}
