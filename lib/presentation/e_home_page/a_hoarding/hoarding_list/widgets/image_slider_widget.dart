import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:oohapp/presentation/e_home_page/a_hoarding/hoarding_list/data_model/hoarding_list_data_mode.dart';

class ImageSliderWidget extends StatefulWidget {
  final Hoarding hoarding;
  const ImageSliderWidget({super.key, required this.hoarding});

  @override
  State<ImageSliderWidget> createState() => _ImageSliderWidgetState();
}

class _ImageSliderWidgetState extends State<ImageSliderWidget> {
    int _current = 0;
       final CarouselController _carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {

    return       CarouselSlider.builder(
                carouselController: _carouselController,
                itemCount: widget.hoarding.imagePaths.length,
                options: CarouselOptions(
                  viewportFraction: 1.0,
                  autoPlay: false,
                  enlargeCenterPage: false,
                  height: 210,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
                itemBuilder: (context, index, realIdx) {
                  return Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: <Widget>[
                      Positioned.fill(
                     
                        child: Image.asset(
                          widget.hoarding.imagePaths[index],
                          fit: BoxFit.cover,
                          height: 210,
                        ),
                      ),
                      Positioned(
                        bottom:
                            10, 
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: widget.hoarding.imagePaths
                              .asMap()
                              .entries
                              .map((entry) {
                            return GestureDetector(
                              onTap: () =>
                                  _carouselController.animateToPage(entry.key),
                              child: Container(
                                width: 12.0,
                                height: 12.0,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 4.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _current == entry.key
                                      ? Colors.green
                                      : Colors.white,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          width: 89,
                          height: 25,
                          decoration: BoxDecoration(
                            color: widget.hoarding.isPublished
                                ? const Color(0xFF009A5C)
                                : Colors.red, // Color based on published status
                            borderRadius: BorderRadius.circular(12.5),
                          ),
                          child: Center(
                            child: Text(
                              widget.hoarding.statusText,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 10,
                        bottom: 30,
                        child: Container(
                          width: 43,
                          height: 32,
                          decoration: ShapeDecoration(
                            color: Colors.black.withOpacity(0.699999988079071),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                          ),
                          child: Center(
                            child: Text(
                              '${index + 1}/${widget.hoarding.imagePaths.length}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
  }
}