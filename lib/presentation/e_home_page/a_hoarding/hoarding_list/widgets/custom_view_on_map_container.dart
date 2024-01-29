import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:oohapp/core/app_export.dart';
import 'package:oohapp/presentation/e_home_page/a_hoarding/hoarding_list/data_model/hoarding_list_data_mode.dart';

class ViewOnMapContainerWidget extends StatelessWidget {
  final Hoarding hoarding;
  const ViewOnMapContainerWidget({super.key, required this.hoarding});

  @override
  Widget build(BuildContext context) {
    return  Container(
                        width: double.infinity,
                        height: 44,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFF5F5F6),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: CustomImageView(
                                imagePath: ImageConstant.mapicon,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 18),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment
                                  .center, // Align the column to center along the cross axis
                              children: [
                                Text(
                                  truncateWithEllipsis(
                                      hoarding.exactloaction, 3),
                                  style: const TextStyle(
                                    color: Color(0xFF282C3E),
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.50,
                                  ),
                                ),
                                const Text(
                                  'View on Map',
                                  style: TextStyle(
                                    color: Color(0xFFFF8900),
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                    letterSpacing: 0.50,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(), // This will push the following widgets to the end of the row
                            IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context,
                                    Routes.firsthoardinglocationScreen);
                              },
                              icon: Image.asset(
                                ImageConstant.rightarrowicon,
                                width:
                                    26, // You can set the width of the image if necessary
                                height: 26,
                              ),
                            ),
                          ],
                        ),
                      );
  }
    String truncateWithEllipsis(String text, int wordLimit) {
    var wordList = text.split(' ');
    if (wordList.length > wordLimit) {
      return wordList.take(wordLimit).join(' ') + '...';
    } else {
      return text;
    }
  }
}