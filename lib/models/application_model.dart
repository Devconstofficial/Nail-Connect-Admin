import 'package:get/get.dart';

class ApplicationModel {
  final String placeName;
  final String title;
  final String address;
  final String description;
  final List<String> requirements;
  final String type;
  final int numberOfPositions;
  final int numberOfApplicants;
  final String commission;
  final String duration; 
  final String date;
  final RxString status;
  final String? userImage;
  final String? userName;

  ApplicationModel({
    required this.placeName,
    required this.title,
    required this.address,
    required this.description,
    required this.requirements,
    required this.type,
    required this.numberOfPositions,
    required this.numberOfApplicants,
    required this.commission,
    required this.duration,
    required this.date,
    required this.status,
    this.userImage,
    this.userName
  });
}
