
import 'package:oohapp/core/app_export.dart'; // Replace with your actual import path
import 'package:oohapp/core/constants/global_cubit/character_count_cubit.dart'; // Replace with your actual import path

class NewCustomTextFormField extends StatelessWidget {
  const NewCustomTextFormField({
    Key? key,
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
    this.lasttext,
    this.labelText,
    this.maxLength,
    this.keyboardType,
    this.placeholder,
    this.showCharacterCount = false,
    this.onChanged,
    this.validator,
    this.requiredsign,
  }) : super(key: key);

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
  final String? lasttext;
  final String? labelText;
  final int? maxLength;
  final TextInputType? keyboardType;
  final String? placeholder;
  final bool? showCharacterCount;
  final void Function(String)? onChanged;
    final String? Function(String?)? validator;
    final bool? requiredsign;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
    
      width: width ?? ScaleSize.width(100),
      decoration: BoxDecoration(
        color: color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           if(requiredsign==true)
     Row(
      children: [
             CustomText.calloutText(
            text: placeholder,
            color: CustomColors.blackColor,
          ),
          CustomText.calloutText(
            text: '*',
            color: Colors.red,
          )
      ],
     )
     else
       CustomText.calloutText(
            text: placeholder,
            color: CustomColors.blackColor,
          ),
          const SizedBox(height: 8.0),
          Container(
            // height: height ?? ScaleSize.height(5.66),
            decoration: BoxDecoration(
              color: color,
            ),
            child: Stack(
              children: [
                TextFormField(
                  validator: validator,
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  keyboardType: keyboardType,
                  maxLength: maxLength,
                  controller: controller,
                  obscureText: obscureText ?? false,
                  maxLines: maxLines,
                  onChanged: onChanged,
                  decoration: InputDecoration(
                    focusColor: CustomColors.inactiveButton,
                    labelStyle:
                        const TextStyle(color: CustomColors.inactiveButton),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 2.0,
                      horizontal: 8.0,
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: CustomColors.blackColor,
                      ),
                    ),
                    counterText: '',
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: CustomColors.blackColor),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
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
                if (showCharacterCount == true)
                  Positioned(
                    bottom: 0,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        color: CustomColors.grey,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: BlocBuilder<CharacterCountCubit, int>(
                        builder: (context, count) {
                          return CustomText.calloutText(
                            text: '$count/${maxLength ?? 0}',
                            color: CustomColors.blackColor,
                          );
                        },
                      ),
                    ),
                  ),
                if (lasttext != null && lasttext!.isNotEmpty)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: GestureDetector(
                      onTap: onPressed,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          lasttext!,
                          style: TextStyle(
                            color: Color(0xFF0089E1),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
