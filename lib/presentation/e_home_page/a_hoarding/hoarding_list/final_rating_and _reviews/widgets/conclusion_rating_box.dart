import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:oohapp/presentation/e_home_page/a_hoarding/hoarding_list/widgets/custom_rating_display_box.dart';

import '../../../../../../core/app_export.dart';

class ConclusionRatingContainer extends StatelessWidget {
  const ConclusionRatingContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      height: 48,
      decoration: ShapeDecoration(
        color: const Color(0xFFF5F5F6),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
                child: RatingBadge(
                    ratingText: '4.0',
                    textColor: Colors.white,
                    iconColor: Colors.white,
                    backgroundColor: Colors.blue)),
            const SizedBox(
              width: 6,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const Text(
                      'Excellent',
                      style: TextStyle(
                        color: Color(0xFF0089E1),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                        letterSpacing: 0.50,
                      ),
                    ),
                    CustomText.subHeadingText(
                      text: '(2423 Ratings)',
                      color: const Color(0xFF282C3E),
                    )
                  ],
                ),
                const Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '1526',
                            style: TextStyle(
                              color: Color(0xFF282C3E),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0,
                              letterSpacing: 0.50,
                            ),
                          ),
                          TextSpan(
                            text: ' ',
                            style: TextStyle(
                              color: Color(0xFF282C3E),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w300,
                              height: 0,
                              letterSpacing: 0.50,
                            ),
                          ),
                          TextSpan(
                            text:
                                'User Reviews and 3256 Ratings',
                            style: TextStyle(
                              color: Color(0xFF282C3E),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              height: 0,
                              letterSpacing: 0.50,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            const Spacer(), // This will push the following widgets to the end of the row
            IconButton(
              onPressed: () {
                // Navigator.pushNamed(context,
                //     Routes.firsthoardinglocationScreen);
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
      ),
    );
  }
}