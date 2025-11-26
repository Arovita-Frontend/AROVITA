import 'package:flutter/material.dart';
import '../../models/specialty.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Example list.
final List<Specialty> sampleSpecialties = [
  Specialty(
    title: 'General Physician',
    subtitle: 'For common illnesses and general health',
    mobileSubtitle: 'For common illnesses',
    iconData: Icons.person,
  ),
  Specialty(
    title: 'Cardiologist',
    subtitle: 'Heart and cardiovascular health',
    mobileSubtitle: 'Heart & circulation',
    iconData: Icons.favorite,
  ),
  Specialty(
    title: 'Dermatologist',
    subtitle: 'Skin, hair, and nail conditions',
    mobileSubtitle: 'For skin & hair',
    iconData: Icons.health_and_safety,
  ),
  Specialty(
    title: 'ENT Specialist',
    subtitle: 'Ear, nose, and throat issues',
    mobileSubtitle: 'Ear, nose & throat',
    iconData: Icons.hearing,
  ),
  Specialty(
    title: 'Orthopedic',
    subtitle: 'Bone, joint, and muscle problems',
    mobileSubtitle: 'Bones & joints',
    iconData: FontAwesomeIcons.bone,
  ),
  Specialty(
    title: 'Gynecologist',
    subtitle: "Women's health and wellness",
    mobileSubtitle: "Women's health",
    iconData: Icons.female,
  ),
  Specialty(
    title: 'Psychiatrist',
    subtitle: 'Mental health and therapy',
    mobileSubtitle: 'Mental health',
    iconData: Icons.psychology,
  ),
  Specialty(
    title: 'Dentist',
    subtitle: 'Oral and dental health',
    mobileSubtitle: 'Dental care',
    iconData: FontAwesomeIcons.tooth,
  ),
  Specialty(
    title: 'Nutritionist',
    subtitle: 'Diet and nutrition guidance',
    mobileSubtitle: 'Diet & wellness',
    iconData: FontAwesomeIcons.appleWhole,
  ),

  // coming soon ones:
  Specialty(
    title: 'Pediatrician',
    subtitle: "Children's health and development",
    mobileSubtitle: 'Child care',
    iconData: Icons.child_care,
    comingSoon: true,
  ),
  Specialty(
    title: 'Physiotherapy',
    subtitle: 'Physical rehabilitation therapy',
    mobileSubtitle: 'Physical therapy',
    iconData: Icons.accessibility_new,
    comingSoon: true,
  ),
  Specialty(
    title: 'Ophthalmologist',
    subtitle: 'Eye care and vision health',
    mobileSubtitle: 'Eye care',
    iconData: Icons.remove_red_eye,
    comingSoon: true,
  ),
];

// Simple recent consultations with last visit text
final List<Specialty> sampleRecentConsultations = [
  Specialty(
    title: 'General Physician',
    subtitle: '',
    iconData: Icons.person,
    lastVisitText: '2 days ago',
  ),
  Specialty(
    title: 'Psychiatrist',
    subtitle: '',
    iconData: Icons.psychology,
    lastVisitText: '1 week ago',
  ),
];
