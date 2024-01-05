import 'package:flutter/material.dart';
import 'package:oohapp/themes/custom_colors.dart';

import '../scale_size.dart';

class CircularButton extends StatelessWidget {
  const CircularButton({
    Key? key,
    required this.onTap,
    this.iconColor,
    this.backgroundColor,
    this.borderColor,
    this.text,
    this.height,
    this.width,
    this.isDisabled = false,
    this.margin,
    this.alignment,
    required this.icon,
    this.borderWidth,
  }) : super(key: key);

  final VoidCallback onTap;
  final Color? iconColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final String? text;
  final double? height;
  final double? width;
  final bool isDisabled;
  final EdgeInsets? margin;
  final Alignment? alignment;
  final IconData icon;
  final double? borderWidth;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(100),
      child: Container(
        height: ScaleSize.height(8.0),
        width: ScaleSize.width(8.0),
        decoration: BoxDecoration(
            color: backgroundColor ?? Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(
              color: borderColor ?? Colors.transparent,
            )),
        child: Icon(
          icon,
          color: iconColor ?? CustomColors.linkColor,
        ),
      ),
    );
  }
}
