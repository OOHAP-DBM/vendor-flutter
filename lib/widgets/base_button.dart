import 'package:flutter/cupertino.dart';

class BaseButton extends StatelessWidget {
  const BaseButton(
      {super.key,
      this.onTap,
      this.color,
      this.text,
      this.child,
      this.height,
      this.width,
      this.isDisabled,
      this.margin,
      this.alignment});

  final VoidCallback? onTap;
  final Color? color;
  final String? text;
  final Widget? child;
  final double? height;
  final double? width;
  final bool? isDisabled;
  final EdgeInsets? margin;
  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
