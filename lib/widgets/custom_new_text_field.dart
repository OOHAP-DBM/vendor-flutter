import 'package:oohapp/widgets/custom_text.dart';

import '../core/app_export.dart';

class CustomNewTextFormField extends StatelessWidget {
  const CustomNewTextFormField(
      {super.key,
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
      this.placeholder,
      this.errorColor,
      this.errorText,
      this.widget,
      this.onChanged,
      this.contentPadding,
      this.readOnly,
      this.validator,
      this.minLines,
      this.onTap,
      this.starText,
      this.isDense});

  final VoidCallback? onPressed;
  final Color? color;
  final Color? errorColor;
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
  final int? minLines;
  final String? hintText;
  final String? labelText;
  final int? maxLength;
  final TextInputType? keyboardType;
  final String? placeholder;
  final String? errorText;
  final Widget? widget;
  final bool? readOnly;
  final EdgeInsets? contentPadding;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final String? starText;
  final bool? isDense;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      alignment: Alignment.centerLeft,
      width: width ?? size.width,
      decoration: BoxDecoration(
        color: color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          placeholder != null
              ? Column(
                  children: [
                    Row(
                      children: [
                        CustomText.text(
                            text: placeholder!,
                            color: CustomColors.liteBlack,
                            fontSize: 10.sp,
                            textAlign: TextAlign.start),
                        CustomText.text(
                          text: starText ?? '*',
                          color: CustomColors.errorColor,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.0.h,
                    ),
                  ],
                )
              : const SizedBox.shrink(),
          SizedBox(
            width: width,
            height: height,
            child: Column(
              children: [
                TextFormField(
                  onTap: onTap,
                  /* onTapOutside: (event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },*/
                  readOnly: readOnly ?? false,
                  keyboardType: keyboardType,
                  maxLength: maxLength ?? 30,
                  controller: controller,
                  obscureText: obscureText!,
                  maxLines: maxLines ?? 1,
                  minLines: minLines,
                  style: const TextStyle(height: 1.1),
                  decoration: InputDecoration(
                    // filled: true,
                    fillColor: Colors.transparent,
                    focusColor: errorColor ?? CustomColors.mediumGrey,
                    labelStyle: const TextStyle(color: CustomColors.mediumGrey),
                    contentPadding: contentPadding ??
                        // const EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),

                        EdgeInsets.all(8.5.r),
                    isDense: isDense ?? true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(
                        color: errorColor ?? CustomColors.mediumGrey,
                      ),
                    ),
                    counterText: '',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: errorColor ?? CustomColors.mediumGrey),
                      borderRadius: BorderRadius.all(Radius.circular(4.r)),
                    ),
                    errorStyle: TextStyle(height: 0.0, fontSize: 8.0.sp),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: CustomColors.errorColor,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(4.r)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1,
                          color: errorColor ?? CustomColors.mediumGrey),
                      borderRadius: BorderRadius.all(Radius.circular(4.r)),
                    ),
                    hintText: hintText,
                    hintStyle: TextStyle(
                      color: errorColor ?? CustomColors.mediumGrey,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w300,
                    ),
                    prefixIcon: FittedBox(child: prefixIcon),
                    suffixIcon: FittedBox(child: suffixIcon),
                    /*  Container(
                      padding: const EdgeInsets.all(2.0),
                      color: Colors.cyan,
                      constraints: const BoxConstraints(
                        maxHeight: 7.0,
                        maxWidth: 7.0,
                      ),
                      child: suffixIcon,
                    ),*/
                    suffixIconColor: errorColor ?? CustomColors.mediumGrey,
                    prefixIconColor: errorColor ?? CustomColors.mediumGrey,
                    prefixIconConstraints:
                        const BoxConstraints(minWidth: 15, minHeight: 15),
                    suffixIconConstraints:
                        const BoxConstraints(minWidth: 15, minHeight: 15),
/*
                    prefixIcon: Padding(
                      padding:  EdgeInsets.only(left: 8.sp,right: 3.sp),
                      child: Icon(
                        Icons.search,
                        color: Colors.grey[500],
                      ),*/

                    // manage icon height =>   prefixIconConstraints: BoxConstraints(minWidth: 10, minHeight: 10),
                  ),
                  onChanged: onChanged,
                  validator: validator,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: errorText != null
                      ? Text(
                          errorText!,
                          style: TextStyle(
                            fontSize: 8.sp,
                            color: Colors.red,
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
