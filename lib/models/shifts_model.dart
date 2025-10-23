class Shift {
  final String placeName;
  final String title;
  final String address;
  final String description;
  final List<String> requirements;
  final String type;
  final int numberOfPositions;
  final double hourlyRate;
  final String duration; 
  final String date;
  final String status;

  Shift({
    required this.placeName,
    required this.title,
    required this.address,
    required this.description,
    required this.requirements,
    required this.type,
    required this.numberOfPositions,
    required this.hourlyRate,
    required this.duration,
    required this.date,
    required this.status,
  });
}
