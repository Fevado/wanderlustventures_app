class Destination {
  final String name;
  final String imagePath;
  final String description;
  bool isBookmarked;

  Destination({
    required this.name,
    required this.imagePath,
    required this.description,
    this.isBookmarked = false,
  });
}
