import 'package:flutter/material.dart';
import 'header.dart';
import 'recent_consultations.dart';
import 'specialty_card.dart';
import '../../../../models/specialty.dart';
import 'specialties_data.dart';

class SelectSpecialtyPage extends StatefulWidget {
  const SelectSpecialtyPage({super.key});

  @override
  State<SelectSpecialtyPage> createState() => _SelectSpecialtyPageState();
}

class _SelectSpecialtyPageState extends State<SelectSpecialtyPage> {
  Specialty? selectedSpecialty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;

            final horizontalPadding = width > 900 ? 80.0 : 16.0;
            final verticalPadding = 16.0;

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // HEADER
                  Header(
                    title: 'Select a Specialty',
                    subtitle: "Choose the department you'd like to consult",
                  ),

                  // PAGE CONTENT
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding,
                      vertical: verticalPadding,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 25),

                        RecentConsultations(recent: sampleRecentConsultations),
                        const SizedBox(height: 16),

                        Text(
                          'All Specialties',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 12),

                        _buildSpecialitiesGrid(width),

                        const SizedBox(height: 60),
                      ],
                    ),
                  ),

                  // FOOTER WITH NEXT BUTTON
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 80,
                      vertical: 24,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: selectedSpecialty == null
                                ? null
                                : () {
                                    // TODO: Use selectedSpecialty
                                    debugPrint(
                                      "Selected: ${selectedSpecialty!.title}",
                                    );
                                  },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: selectedSpecialty == null
                                  ? Colors.grey[300] // disabled state
                                  : const Color(
                                      0xFF7C3AED,
                                    ),
                              foregroundColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                            ),
                            child: const Text('Next'),
                          ),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          'Consultations available 24x7 worldwide',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: Colors.grey[600]),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // ============================
  //      RESPONSIVE GRID
  // ============================
  Widget _buildSpecialitiesGrid(double width) {
    int crossAxisCount = width >= 900 ? 3 : 2;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: sampleSpecialties.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        mainAxisExtent: 180,
      ),
      itemBuilder: (context, index) {
        final item = sampleSpecialties[index];

        return SpecialtyCard(
          specialty: item,
          isSelected: selectedSpecialty == item,
          onTap: () {
            if (item.comingSoon) return;
            setState(() {
              selectedSpecialty = item;
            });
          },
        );
      },
    );
  }
}
