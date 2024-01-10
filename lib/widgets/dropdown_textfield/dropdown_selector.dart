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
    this.onChanged
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
  final void Function(String?)? onDropdownChanged; 
    final void Function(String)? onChanged; // New property for onChanged
// Fix here

  @override
  Widget build(BuildContext context) {
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (placeholder != null)
          CustomText.calloutText(
            text: placeholder,
            color: CustomColors.blackColor,
          ),
        SizedBox(height: 8),
        DropdownButtonFormField<String>(
          
          decoration: InputDecoration(
            border: OutlineInputBorder(),
             contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            isDense: true,
          ),
          value: controller!.text.isEmpty ? null : controller!.text,
          isExpanded: true,
          iconSize: 30,
          
          style: TextStyle(color: Colors.black, fontSize: 16),
            hint: controller!.text.isEmpty
              ? Text(
                  hintText!,
                  style: const TextStyle(
                      color: CustomColors.grey,
                      fontWeight: FontWeight.w300,
                    ),
                )
              : null,
          items: choices!.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(color:  Colors.black),
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            if (newValue != null) {
              controller!.text = newValue;
              if (onDropdownChanged != null) {
                onDropdownChanged!(newValue);
              }
            }
          },
          dropdownColor:Colors.white,
        ),
      ],
    );
  }
}