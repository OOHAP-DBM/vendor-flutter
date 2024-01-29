import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/app_export.dart'; // Ensure you have flutter_svg package added in your pubspec.yaml

// Make sure to import your custom widgets and constants like CustomText, ImageConstant, etc.

void showCustomBottomSheetRatingScreen(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return RatingBottomSheet();
    },
  );
}

class RatingBottomSheet extends StatefulWidget {
  @override
  _RatingBottomSheetState createState() => _RatingBottomSheetState();
}

class _RatingBottomSheetState extends State<RatingBottomSheet> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
 
      height:ScaleSize.height(42),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(19),
            topRight: Radius.circular(19),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 24, bottom: 12, left: 39, right: 39),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText.secondaryTitle(
              text: 'Please rate listing experience',
              color: Colors.black,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
   
            SizedBox(
              height: ScaleSize.width(15), // Adjust the height accordingly
              width: ScaleSize.width(50), // Adjust the width accordingly
              child: SvgPicture.asset(
                'assets/images/vendor_logo.svg', // Replace with your asset path
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    _rating > index ? Icons.star : Icons.star_border,
                    color: _rating > index ? Colors.amber : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _rating = index + 1;
                    });
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
