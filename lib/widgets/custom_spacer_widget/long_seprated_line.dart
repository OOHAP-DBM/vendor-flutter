
import 'package:flutter/material.dart';

class LongSepratedLine extends StatelessWidget {
  const LongSepratedLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignCenter,
            color: Color(0xFFECECEC),
          ),
        ),
      ),
    );
  }
}
