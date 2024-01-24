import 'package:flutter/material.dart';
import 'package:oohapp/presentation/e_home_page/a_hoarding/hoarding_list/data_model/review_data_model.dart';

class Hoarding extends ChangeNotifier {
  String title;
  String location;
  String category;
  String size;
  List<String> imagePaths; // Changed to a list of strings
  bool isPublished;
  int daysAvailable;
  bool isAvailable;
  double price;
  String  description;
  String approvedfromnagarnigam;
  String backlighting;
  String printingandmountingservice;
  List<String> targetaudience;
  List<bool> hoardingvisibility;
  List<String> imagepathrecentlybookedby;
  List<String> namerecentlybookedby;
  int noofrating;
  String  exactloaction;
  
    List<Review> reviews;


  Hoarding({
    required this.title,
    required this.location,
    required this.category,
    required this.size,
    required this.imagePaths, // Changed to a list of strings
    required this.isAvailable,
    this.isPublished = false,
    required this.daysAvailable,
    required this.approvedfromnagarnigam,
    required this.backlighting,
 
    required this.description,
    required this.hoardingvisibility,
    required this.imagepathrecentlybookedby,
    required this.namerecentlybookedby,
    required this.noofrating,
    required this.price,
    required this.printingandmountingservice,
    required this.targetaudience,
    required this.reviews,
    required this.exactloaction,
  });

  void togglePublished() {
    isPublished = !isPublished;
    notifyListeners(); 
  }

  Color get backgroundColor => isPublished ? Color(0xFFD9F2E6) : Color(0xFFFFDDDD);
  String get statusText => isPublished  ?'Published' : 'Unpublish';
  Color get textColor => isPublished ? Colors.green : Colors.red;
}
