/*


import 'package:oohapp/core/app_export.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
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
      this.validator, this.minLines});

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
          Row(
            children: [
              CustomText.spanText(
                text: placeholder,
                color: CustomColors.liteBlack,
                textAlign: TextAlign.start,
              ),
              CustomText.spanText(
                text: '*',
                color: CustomColors.errorColor,
              ),
            ],
          ),
          const SizedBox(
            height: 5.0,
          ),
          SizedBox(
            height: height,
            child: TextFormField(
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              readOnly: readOnly ?? false,
              keyboardType: keyboardType,
              maxLength: maxLength ?? 30,
              controller: controller,
              obscureText: obscureText!,
              maxLines: maxLines,
              minLines: minLines,
              style: const TextStyle(height: 1.1),
              decoration: InputDecoration(
                fillColor: Colors.transparent,
                focusColor: errorColor ?? CustomColors.inactiveButton,
                labelStyle: const TextStyle(color: CustomColors.inactiveButton),
                contentPadding: contentPadding ??

                EdgeInsets.all(8.5.r),
                isDense: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(0.0)),
                  borderSide: BorderSide(
                    color: errorColor ?? CustomColors.inactiveButton,
                  ),
                ),
                counterText: '',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: errorColor ?? CustomColors.inactiveButton),
                  borderRadius: const BorderRadius.all(Radius.circular(0.0)),
                ),
                errorStyle: const TextStyle(height: 0.0, fontSize: 10.0),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: CustomColors.errorColor,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(0.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1,
                      color: errorColor ?? CustomColors.inactiveButton),
                  borderRadius: const BorderRadius.all(Radius.circular(0.0)),
                ),
                hintText: hintText,
                hintStyle: TextStyle(
                  color: errorColor ?? CustomColors.inactiveButton,
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                */
/*  Container(
                  padding: const EdgeInsets.all(2.0),
                  color: Colors.cyan,
                  constraints: const BoxConstraints(
                    maxHeight: 7.0,
                    maxWidth: 7.0,
                  ),
                  child: suffixIcon,
                ),*//*

                suffixIconColor: errorColor ?? CustomColors.inactiveButton,
                prefixIconColor: errorColor ?? CustomColors.inactiveButton,
              ),
              onChanged: onChanged,
              validator: validator,
            ),
          ),
        ],
      ),
    );
  }
}*/
