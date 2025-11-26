// lib/screens/choose_doctor/widgets/doctor_list.dart
import 'package:flutter/material.dart';
import '../../../models/doctor.dart';
import 'doctor_card.dart';
import '../../../utils/responsive.dart';

class DoctorList extends StatelessWidget {
  final List<Doctor> doctors;
  final void Function(Doctor)? onBook;

  const DoctorList({super.key, required this.doctors, this.onBook});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile;

    return ListView.builder(
      padding: EdgeInsets.only(bottom: 20),
      itemCount: doctors.length,
      itemBuilder: (context, index) {
        return DoctorCard(
          doctor: doctors[index],
          onBook: () => onBook?.call(doctors[index]),
        );
      },
    );
  }
}
