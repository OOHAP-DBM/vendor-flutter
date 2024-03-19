import 'package:dotted_border/dotted_border.dart';
import 'package:oohapp/core/app_export.dart';

import 'package:oohapp/core/constants/global_cubit/character_count_cubit.dart';

class CustomLogoEntryTextFormField extends StatelessWidget {
  const CustomLogoEntryTextFormField({
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
    this.labelText,
    this.maxLength,
    this.keyboardType,
    this.placeholder,
    this.showCharacterCount = false,
    this.onChanged,
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
  final String? labelText;
  final int? maxLength;
  final TextInputType? keyboardType;
  final String? placeholder;
  final bool? showCharacterCount;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: DottedBorder(
          color: Colors.grey,
                borderType: BorderType.RRect,
                radius: const Radius.circular(12),
                padding: EdgeInsets.zero,
                dashPattern: const [8, 4],
                strokeWidth: 2,
        child: Container(
          height: size.height * 0.056,
          decoration: BoxDecoration(
            color: color,
          ),
          child: Column(
            children: [
          
              TextFormField(
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
                    vertical: 6.0,
                    horizontal: 8.0,
                  ),
           
                  counterText: '',
               
                 prefixIcon: const Icon(Icons.add),
        
                  hintText: text,
                  hintStyle: const TextStyle(
                    color: CustomColors.grey,
                    fontWeight: FontWeight.w300,
                  ),
                       enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(12),
              ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
