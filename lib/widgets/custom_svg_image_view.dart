import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oohapp/core/app_export.dart';

class CustomSvgImageView extends StatelessWidget {
  const CustomSvgImageView({
    super.key,
    this.alignment,
    this.onTap,
    this.url,
    required this.svgPath,
    this.color,
    this.height,
    this.width,
    required this.fit,
  });

  final double? height;
  final double? width;
  final Color? color;
  final BoxFit fit;
  final Alignment? alignment;
  final VoidCallback? onTap;
  final String? url;
  final String svgPath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
     /* width: width ?? ScaleSize.width(20.0),
      height: height ?? ScaleSize.height(20.0),*/
      width: width,
      height: height ,
      child: SvgPicture.asset(
        svgPath,
        fit: fit,
      ),
    );
  }
}
