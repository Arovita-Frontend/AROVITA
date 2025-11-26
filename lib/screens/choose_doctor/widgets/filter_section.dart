import 'package:flutter/material.dart';
import '../../../utils/responsive.dart';

class FilterSection extends StatelessWidget {
  final List<String> filters;
  final Set<int> selectedFilters;
  final ValueChanged<int>? onSelected;

  const FilterSection({
    super.key,
    this.filters = const [
      'All Doctors', 'Male', 'Female', 'Online Now', '10+ Years', '4.5+'
    ],
    required this.selectedFilters,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final scale = Responsive.scaleFactor(context);
    final double horizontalPadding =
        Responsive.isDesktop ? 40 * scale : 20 * scale;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: 10 * scale,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(filters.length, (i) {
            final selected = selectedFilters.contains(i);

            return Padding(
              padding: EdgeInsets.only(right: 8 * scale),
              child: ChoiceChip(
                label: Text(
                  filters[i],
                  style: TextStyle(
                    fontSize: 12 * scale,
                    color: selected ? Colors.white : Colors.black87,
                  ),
                ),
                selected: selected,
                onSelected: (_) => onSelected?.call(i),
                backgroundColor: Colors.white,
                selectedColor: const Color(0xFF7C3AED),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(
                    color: selected
                        ? const Color(0xFF7C3AED)
                        : Colors.grey.shade300,
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 14 * scale,
                  vertical: 8 * scale,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
