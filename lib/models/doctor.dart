class Doctor {
  final String id;
  final String name;
  final String qualification;
  final String specialty;
  final int yearsExperience;
  final double rating;
  final int reviews;
  final bool isOnline;
  final bool isAvailable;
  final List<String> languages;
  final String avatarAsset;
  final String gender;
  final int age;

  Doctor({
    required this.id,
    required this.name,
    this.qualification = '',
    this.specialty = '',
    required this.yearsExperience,
    required this.rating,
    required this.reviews,
    required this.isOnline,
    this.isAvailable = true,
    this.languages = const [],
    this.avatarAsset = '',
    this.gender = 'Gender',
    this.age = 30,
  });
}