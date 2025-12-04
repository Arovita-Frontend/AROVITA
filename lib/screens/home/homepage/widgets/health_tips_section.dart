import 'package:arovita/utils/responsive.dart';
import 'package:flutter/material.dart';
import '../../../../models/health_tip.dart';
import 'health_tip_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HealthTipsSection extends StatelessWidget {
  const HealthTipsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<HealthTip> tips = [
      HealthTip(
        icon: Icons.water_drop,
        iconColor: Colors.blue,
        title: "Stay Hydrated",
        subtitle: "Drink at least 8 glasses of water daily",
        gradient: const LinearGradient(
          colors: [Color(0xFFEAF0FF), Color(0xFFF9EFFF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      HealthTip(
        icon: FontAwesomeIcons.dumbbell,
        iconColor: Colors.green,
        title: "Stretch Regularly",
        subtitle: "Take a 5-minute stretch break every hour",
        gradient: const LinearGradient(
          colors: [Color(0xFFEFFFF4), Color(0xFFDFFFF9)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Health Tips",
          style: TextStyle(
            fontSize: Responsive.desktopText18,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 12),

        LayoutBuilder(
          builder: (context, constraints) {
            double cardWidth = 260;
            double totalWidth = tips.length * cardWidth + (tips.length - 1) * 16;

            bool needScroll = constraints.maxWidth < totalWidth;

            return SizedBox(
              height: 120,
              child: needScroll
                  ? _scrollableList(tips, cardWidth)
                  : _rowList(tips, cardWidth),
            );
          },
        ),
      ],
    );
  }

  // Wide screen → side-by-side
  Widget _rowList(List<HealthTip> tips, double width) {
    return Row(
      children: List.generate(tips.length, (index) {
        return Row(
          children: [
            HealthTipCard(tip: tips[index], width: width),
            if (index != tips.length - 1) const SizedBox(width: 16),
          ],
        );
      }),
    );
  }

  // Narrow screen → horizontal scroll
  Widget _scrollableList(List<HealthTip> tips, double width) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) =>
          HealthTipCard(tip: tips[index], width: width),
      separatorBuilder: (context, index) => const SizedBox(width: 16),
      itemCount: tips.length,
    );
  }
}