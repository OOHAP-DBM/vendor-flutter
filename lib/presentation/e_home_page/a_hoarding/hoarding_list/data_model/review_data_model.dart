class Review {
  String name;
  double rating;
  String comment;
  List<String>?imagePath;
  String? vendorreply;
  String date;

  Review({
    required this.name,
    required this.rating,
    required this.comment,
    this.imagePath,
    this.vendorreply,
    required this.date
    
  });
}
