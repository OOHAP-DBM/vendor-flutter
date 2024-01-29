import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../../core/app_export.dart';

class InfoRowWidget extends StatelessWidget {
  final String title;
  final String value;
  const InfoRowWidget({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText.subHeadingText(
              text: title, color: const Color(0xFF282C3E)),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: value == 'YES' ? Colors.green : Colors.black,
            ),
          ),
        ],
      ),
    );;
  }
}