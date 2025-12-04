import 'package:flutter/material.dart';
import '../../../../../models/doctor.dart';
import '../../../../../utils/responsive.dart';

class DoctorCard extends StatelessWidget {
  final Doctor doctor;
  final VoidCallback? onBook;

  const DoctorCard({super.key, required this.doctor, this.onBook});

  Widget _avatar(BuildContext context, double size) {
    if (doctor.avatarAsset.isNotEmpty) {
      return CircleAvatar(
        radius: size / 2,
        backgroundImage: AssetImage(doctor.avatarAsset),
        backgroundColor: Colors.grey[100],
      );
    }
    return CircleAvatar(
      radius: size / 2,
      backgroundColor: Colors.grey[200],
      child: Text(
        doctor.name
            .split(' ')
            .map((e) => e.isNotEmpty ? e[0] : '')
            .take(2)
            .join(),
        style: TextStyle(fontSize: size * 0.36, fontWeight: FontWeight.w600),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile;
    final scale = Responsive.scaleFactor(context);

    final avatarSize = isMobile ? 52.0 * scale : 64.0 * scale;
    final cardPadding = 14.0 * scale;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 520;

        final card = Container(
          padding: EdgeInsets.all(cardPadding),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12 * scale),
            border: Border.all(color: Colors.grey[200]!),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: isWide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _avatar(context, avatarSize),
                    SizedBox(width: 16 * scale),
                    // Info column
                    Expanded(
                      child: _DoctorInfo(doctor: doctor, scale: scale),
                    ),
                    SizedBox(width: 16 * scale),
                    // Right column: rating 
                    _RightColumn(doctor: doctor, scale: scale, onBook: onBook),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _avatar(context, avatarSize),
                        SizedBox(width: 12 * scale),
                        Expanded(
                          child: _DoctorInfo(doctor: doctor, scale: scale),
                        ),
                      ],
                    ),
                    SizedBox(height: 12 * scale),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // rating left on mobile
                        _RatingChip(
                          rating: doctor.rating,
                          reviews: doctor.reviews,
                          scale: scale,
                        ),
                        Spacer(),
                        SizedBox(
                          height: 40 * scale,
                          child: ElevatedButton(
                            onPressed: doctor.isAvailable ? onBook : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF7C3AED),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8 * scale),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 14 * scale,
                              ),
                            ),
                            child: Text(
                              doctor.isAvailable ? 'Book Now' : 'Not Available',
                              style: TextStyle(
                                fontSize: 14 * scale,
                                color: Colors.white,  
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
        );

        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: 8 * scale,
            horizontal: isMobile ? 14 * scale : 20 * scale,
          ),
          child: card,
        );
      },
    );
  }
}

class _DoctorInfo extends StatelessWidget {
  final Doctor doctor;
  final double scale;

  const _DoctorInfo({required this.doctor, required this.scale});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Name
        Text(
          doctor.name,
          style: TextStyle(fontSize: 16 * scale, fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 6 * scale),
        // Qualification
        Text(
          doctor.qualification,
          style: TextStyle(
            fontSize: 13 * scale,
            color: Colors.grey[800],
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 4 * scale),
        // Specialty
        Text(
          doctor.specialty,
          style: TextStyle(fontSize: 13 * scale, color: Colors.grey[700]),
        ),
        SizedBox(height: 8 * scale),
        // Experience • Gender, Age
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '${doctor.yearsExperience} years experience',
              style: TextStyle(fontSize: 12 * scale, color: Colors.grey[700]),
            ),
            SizedBox(width: 8 * scale),
            Text(
              '•',
              style: TextStyle(
                fontSize: 12 * scale,
                color: Colors.grey[500]!.withOpacity(0.9),
              ),
            ),
            SizedBox(width: 8 * scale),
            Text(
              '${doctor.gender}, ${doctor.age}',
              style: TextStyle(fontSize: 12 * scale, color: Colors.grey[700]),
            ),
          ],
        ),
        SizedBox(height: 8 * scale),
        // Languages + Online Now in one row
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                doctor.languages.join(', '),
                style: TextStyle(fontSize: 12 * scale, color: Colors.grey[700]),
                overflow: TextOverflow.ellipsis,
              ),
            ),

            SizedBox(width: 6 * scale), // small gap

            if (doctor.isOnline)
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10 * scale,
                  vertical: 5 * scale,
                ),
                decoration: BoxDecoration(
                  color: Color(0xFF16A34A),
                  borderRadius: BorderRadius.circular(20 * scale),
                ),
                child: Text(
                  'Online Now',
                  style: TextStyle(
                    fontSize: 12 * scale,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
          ],
        ),

        SizedBox(height: 8 * scale),
      ],
    );
  }
}

class _RightColumn extends StatelessWidget {
  final Doctor doctor;
  final double scale;
  final VoidCallback? onBook;

  const _RightColumn({required this.doctor, required this.scale, this.onBook});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _RatingChip(
          rating: doctor.rating,
          reviews: doctor.reviews,
          scale: scale,
        ),
        SizedBox(height: 10 * scale),
        SizedBox(
          width: 120 * scale,
          height: 40 * scale,
          child: ElevatedButton(
            onPressed: doctor.isAvailable ? onBook : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF7C3AED),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8 * scale),
              ),
            ),
            child: Text(
              doctor.isAvailable ? 'Book Now' : 'Not Available',
              style: TextStyle(
                fontSize: 14 * scale,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _RatingChip extends StatelessWidget {
  final double rating;
  final int reviews;
  final double scale;
  const _RatingChip({
    required this.rating,
    required this.reviews,
    required this.scale,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star, size: 16 * scale, color: Colors.orange),
        SizedBox(width: 6 * scale),
        Text(
          rating.toStringAsFixed(1),
          style: TextStyle(fontSize: 13 * scale, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
