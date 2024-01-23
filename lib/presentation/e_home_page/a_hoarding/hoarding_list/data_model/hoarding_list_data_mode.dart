import 'package:flutter/material.dart';

class Hoarding extends ChangeNotifier {
  String title;
  String location;
  String category;
  String size;
  List<String> imagePaths; // Changed to a list of strings
  bool isPublished;
  int? daysAvailable;
  bool isAvailable;

  Hoarding({
    required this.title,
    required this.location,
    required this.category,
    required this.size,
    required this.imagePaths, // Changed to a list of strings
    required this.isAvailable,
    this.isPublished = false,
    this.daysAvailable,
  });

  void togglePublished() {
    isPublished = !isPublished;
    notifyListeners(); 
  }

  Color get backgroundColor => isPublished ? Color(0xFFD9F2E6) : Color(0xFFFFDDDD);
  String get statusText => isPublished ? 'Published' : 'Unpublish';
  Color get textColor => isPublished ? Colors.green : Colors.red;
}
