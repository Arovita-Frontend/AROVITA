import 'package:flutter/material.dart';
import '../../../../models/doctor.dart';
import 'widgets/header_section.dart';
import 'widgets/filter_section.dart';
import 'widgets/doctor_list.dart';
import '../../../../utils/responsive.dart';
import '../../../../core/widgets/bottom_nav_bar.dart';

class ChooseDoctorPage extends StatefulWidget {
  const ChooseDoctorPage({super.key});

  @override
  State<ChooseDoctorPage> createState() => _ChooseDoctorPageState();
}

class _ChooseDoctorPageState extends State<ChooseDoctorPage> {
  /// MULTI FILTER SELECTION
  final Set<int> _selectedFilters = {};

  /// Filtered list 
  List<Doctor> _filteredDoctors = [];

  /// ORIGINAL list
  final List<Doctor> _doctors = [
    Doctor(
      id: 'd1',
      name: 'Dr. Aisha Verma',
      qualification: 'MBBS, MD (Dermatology)',
      specialty: 'Dermatologist',
      yearsExperience: 10,
      rating: 4.8,
      reviews: 320,
      isOnline: true,
      languages: ['English', 'Hindi'],
      avatarAsset: 'assets/images/emma.jpg',
      gender: 'Female',
      age: 38,
    ),
    Doctor(
      id: 'd2',
      name: 'Dr. Rajesh Kumar',
      qualification: 'MBBS, MD (Cardiology)',
      specialty: 'Cardiologist',
      yearsExperience: 15,
      rating: 4.6,
      reviews: 580,
      isOnline: false,
      languages: ['English', 'Hindi', 'Tamil'],
      avatarAsset: 'assets/images/john.jpg',
      gender: 'Male',
      age: 45,
    ),
    Doctor(
      id: 'd3',
      name: 'Dr. Priya Sharma',
      qualification: 'MBBS, MS (Gynecology)',
      specialty: 'Gynecologist',
      yearsExperience: 8,
      rating: 4.7,
      reviews: 245,
      isOnline: true,
      languages: ['English', 'Hindi', 'Bengali'],
      avatarAsset: 'assets/images/smith.jpg',
      isAvailable: true,
      gender: 'Female',
      age: 35,
    ),
    Doctor(
      id: 'd4',
      name: 'Dr. Michael Chen',
      qualification: 'MBBS, MD (Pediatrics)',
      specialty: 'Pediatrician',
      yearsExperience: 12,
      rating: 4.9,
      reviews: 200,
      isOnline: false,
      languages: ['English', 'Mandarin'],
      avatarAsset: 'assets/images/johnson.jpg',
      gender: 'Male',
      age: 40,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _filteredDoctors = List.from(_doctors);
  }

  // BOOK action
  void _onBook(Doctor d) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Book ${d.name}')));
  }

  // WHEN A FILTER IS TOGGLED
  void _onFilterSelected(int index) {
    setState(() {
      if (index == 0) {
        // "All Doctors" → clear everything
        _selectedFilters.clear();
        _filteredDoctors = List.from(_doctors);
        return;
      }

      // Toggle selection
      if (_selectedFilters.contains(index)) {
        _selectedFilters.remove(index);
      } else {
        _selectedFilters.add(index);
      }

      _applyFilters();
    });
  }

  // APPLY FILTERING LOGIC
  void _applyFilters() {
    if (_selectedFilters.isEmpty) {
      _filteredDoctors = List.from(_doctors);
      return;
    }

    List<Doctor> result = List.from(_doctors);

    for (int filter in _selectedFilters) {
      switch (filter) {
        case 1: // Male
          result = result.where((d) => d.gender.toLowerCase() == 'male').toList();
          break;

        case 2: // Female
          result = result.where((d) => d.gender.toLowerCase() == 'female').toList();
          break;

        case 3: // Online Now
          result = result.where((d) => d.isOnline).toList();
          break;

        case 4: // 10+ Years
          result = result.where((d) => d.yearsExperience >= 10).toList();
          break;

        case 5: // 4.5+
          result = result.where((d) => d.rating >= 4.5).toList();
          break;
      }
    }

    _filteredDoctors = result;
  }

  @override
  Widget build(BuildContext context) {
    final scale = Responsive.scaleFactor(context);
    final double horizontalPadding =
        Responsive.isDesktop ? 18 * scale : 20 * scale;

    return Scaffold(
      backgroundColor: const Color.fromARGB(19, 124, 58, 237),
      body: SafeArea(
        child: Column(
          children: [
            HeaderSection(),

            /// FILTER SECTION
            FilterSection(
              selectedFilters: _selectedFilters,
              onSelected: _onFilterSelected,
            ),

            /// DOCTOR LIST
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Card(
                  elevation: 0,
                  color: Colors.transparent,
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(Responsive.isDesktop ? 12.0 : 0.0),
                    child: DoctorList(
                      doctors: _filteredDoctors,
                      onBook: _onBook,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 1),
    );
  }
}
