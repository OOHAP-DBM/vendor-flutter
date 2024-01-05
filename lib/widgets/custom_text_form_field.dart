import 'package:oohapp/core/app_export.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key,
    this.onPressed,
    this.color,
    this.text,
    this.child,
    this.height,
    this.width,
    this.obscureText = false,
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
    this.placeholder});

  final VoidCallback? onPressed;
  final Color? color;
  final String? text;
  final Widget? child;
  final double? height;
  final double? width;
  final bool? obscureText;
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
            height: height ?? ScaleSize.height(5.66),
            decoration: BoxDecoration(
              color: color,
            ),
            child: TextFormField(
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              keyboardType: keyboardType,
              maxLength: maxLength,
              controller: controller,
              obscureText: obscureText!,
              maxLines: maxLines,
              decoration: InputDecoration(
                focusColor: CustomColors.inactiveButton,
                labelStyle: const TextStyle(color: CustomColors.inactiveButton),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 2.0,
                  horizontal: 8.0,
                ),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: CustomColors.blackColor,
                    )),

                counterText: '',
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: CustomColors.blackColor),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                //  labelText: labelText,
                icon: icon,
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: CustomColors.grey,
                  fontWeight: FontWeight.w300,
                ),
                prefixIcon: prefixIcon,
                suffixIconColor: CustomColors.inactiveButton,
                prefixIconColor: CustomColors.inactiveButton,
                suffixIcon: suffixIcon,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
