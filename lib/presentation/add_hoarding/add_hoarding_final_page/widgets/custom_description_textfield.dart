import 'package:oohapp/core/app_export.dart';

import 'package:oohapp/core/constants/global_cubit/character_count_cubit.dart';

class CustomDescriptionTextFormField extends StatelessWidget {
  const CustomDescriptionTextFormField({
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
    this.newcolor,
    this.validator,
    this.requiredsign
  }) : super(key: key);

  final VoidCallback? onPressed;
  final Color? color;
    final Color? newcolor;
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
    final String? Function(String?)? validator;
    final bool? requiredsign;


  @override
  Widget build(BuildContext context) {
    
    return Container(
      alignment: Alignment.center,
      // height: (showCharacterCount!)?ScaleSize.height(18):ScaleSize.height(15),
      
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
     
          const SizedBox(
            height: 8.0,
          ),
          Container(
            // height: height ?? ScaleSize.height(15),
            decoration: BoxDecoration(
              color: newcolor,
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
                  obscureText: obscureText!,
                  maxLines: maxLines,
                  onChanged: (text) {
                    if (onChanged != null) {
                      onChanged!(text);
                    }
                    if (showCharacterCount == true) {
                      context.read<CharacterCountCubit>().updateCharacterCount(text.length);
                    }
                  },
                  decoration: InputDecoration(
                    focusColor: CustomColors.inactiveButton,
                    labelStyle: const TextStyle(color: CustomColors.inactiveButton),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 24.0,
                      horizontal: 24.0,
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: CustomColors.blackColor,
                      ),
                    ),
                    counterText: '',
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: CustomColors.blackColor),
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
                
              ],
            ),
            
          ),
          SizedBox(height: 2,),
          if (showCharacterCount == true)
              BlocBuilder<CharacterCountCubit, int>(
                builder: (context, count) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Align(
                      alignment: AlignmentDirectional.bottomEnd,
                      child: Text(
                        
                        '$count/${maxLength ?? 0} Characters',
                        style: TextStyle(
                          color: CustomColors.blackColor,
                          fontSize: 12, 
                        ),
                      ),
                    ),
                  );
                },
              ),
        ],
      ),
    );
  }
} 