import 'package:flutter/cupertino.dart';

import '../../../core/app_export.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final double? borderRadius;
  final EdgeInsets? padding;
  final ValueChanged<String>? onChanged;

  const SearchTextField({
    key,
    this.controller,
    required this.hintText,
    this.borderRadius = 8.0,
    this.padding = const EdgeInsets.all(8.0),
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius!),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      padding: padding,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        maxLength: 20,
        maxLines: 1,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
              color: Color(0xFF282C3E), fontWeight: FontWeight.w400),
          border: InputBorder.none,
          prefixIcon: Icon(
            CupertinoIcons.search,
            color: const Color(0xFF282C3E),
            size: 28.sp,
          ),
           counterText: '',
        ),
      ),
    );
  }
}
