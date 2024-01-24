class Review {
  String name;
  double rating;
  String comment;
  List<String>?imagePath;

  Review({
    required this.name,
    required this.rating,
    required this.comment,
    this.imagePath
  });
}
