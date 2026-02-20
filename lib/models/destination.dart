class Destination {
  final String name;
  final String imagePath;
  final String description;
  bool isBookmarked;
  String location;
  double pricePerDay;
  bool hasGuide;
  bool hasVehicle;

  Destination({
    required this.name,
    required this.imagePath,
    required this.description,
    this.isBookmarked = false,
    required this.location,
    required this.pricePerDay,
    this.hasGuide = false,
    this.hasVehicle = false
  });
}
