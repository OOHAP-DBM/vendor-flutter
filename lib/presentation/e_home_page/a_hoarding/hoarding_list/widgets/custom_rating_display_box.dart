import 'package:flutter/material.dart';

class RatingBadge extends StatelessWidget {
  final String ratingText;
  final Color textColor;
  final Color iconColor;
  final Color backgroundColor;
  final double? width;
  final double? height;
  final double? fontSize;
  final double? iconSize;
  final double? borderRadius;

  const RatingBadge({
    Key? key,
    required this.ratingText,
    required this.textColor,
    required this.iconColor,
    required this.backgroundColor,
    this.width,
    this.height,
    this.fontSize,
    this.iconSize,
    this.borderRadius = 4.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width??40,
      height: height??26,
      decoration: ShapeDecoration(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius??4.0),
          side: BorderSide(color: Colors.blue)
        ),
        
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              ratingText,
              style: TextStyle(
                color: textColor,
                fontSize: fontSize,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 1,
                letterSpacing: 0.50,
              ),
            ),
            Icon(
              Icons.star,
              color: iconColor,
              size: iconSize??12,
            )
          ],
        ),
      ),
    );
  }
}
