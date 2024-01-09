
import 'package:oohapp/core/app_export.dart';

class CustomTextFieldSelector extends StatelessWidget {
  const CustomTextFieldSelector({
    Key? key,
    this.onPressed,
    this.color,
    this.text,
    this.child,
    this.height,
    this.width,
    this.margin,
    this.alignment,
    this.controller,
    this.icon,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines,
    this.hintText,
    this.labelText,
    this.maxLength,
    this.keyboardType,
    this.placeholder,
    this.choices,
    this.selectedChoice,
    this.onDropdownChanged,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final Color? color;
  final String? text;
  final Widget? child;
  final double? height;
  final double? width;
  final EdgeInsets? margin;
  final Alignment? alignment;
  final TextEditingController? controller;
  final Widget? icon;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLines;
  final String? hintText;
  final String? labelText;
  final int? maxLength;
  final TextInputType? keyboardType;
  final String? placeholder;
  final List<String>? choices;
  final String? selectedChoice;
  final void Function(String?)? onDropdownChanged; // Fix here

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: height ?? ScaleSize.height(9.66),
      width: width ?? ScaleSize.width(100),
      decoration: BoxDecoration(
        color: color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        
          CustomText.calloutText(
            text: placeholder,
            color: CustomColors.blackColor,
          ),
          const SizedBox(
            height: 8.0,
          ),
          Container(
      alignment: alignment ?? Alignment.center,
      height: height ?? ScaleSize.height(9.66),
      width: width ?? ScaleSize.width(100),
      margin: margin,
      decoration: BoxDecoration(
        color: color ?? CustomColors.whiteColor,
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(color: CustomColors.blackColor),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedChoice,
          hint: CustomText.calloutText(
            text: hintText ,
            color: CustomColors.inactiveButton,
          ),
          items: choices?.map((String choice) {
            return DropdownMenuItem<String>(
              value: choice,
              child: Text(choice),
            );
          }).toList(),
          onChanged: onDropdownChanged,
          icon: const Icon(Icons.arrow_drop_down),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: CustomColors.blackColor),
          isExpanded: true,
        ),
      ),
    )
        ],
      ),
    );
  }
}
