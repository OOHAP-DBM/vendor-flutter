import 'package:flutter/material.dart';
import 'package:oohapp/presentation/e_home_page/a_hoarding/hoarding_list/data_model/hoarding_list_data_mode.dart';

import '../../../../../widgets/custom_text.dart';

class ReviewPortionPage extends StatelessWidget {
  final Hoarding hoarding;
  const ReviewPortionPage({super.key, required this.hoarding});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFF282C3E)),
          borderRadius: BorderRadius.circular(9),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x0C000000),
            blurRadius: 6,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 12, left: 12, right: 12, bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText.secondaryTitle(
              text: 'Recently Booked By',
              color: Colors.black,
            ),
            SizedBox(
              height: 16,
            ),

            Container(
              width: double.infinity,
              height: 44,
              decoration: ShapeDecoration(
                color: Color(0xFFF5F5F6),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),

              ),
            )
          ],
        ),
      ),
    );
  }
}
