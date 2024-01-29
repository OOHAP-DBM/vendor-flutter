import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:oohapp/presentation/e_home_page/a_hoarding/hoarding_list/data_model/hoarding_list_data_mode.dart';

import '../../../../../core/app_export.dart';

class PriceShowContainer extends StatelessWidget {
  final Hoarding hoarding;
  const PriceShowContainer({super.key, required this.hoarding});

  @override
  Widget build(BuildContext context) {
    return  Container(
                        width: double.infinity,
                        height: 50,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFDFF2FF),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3)),
                        ),
                        child: Center(
                            child: CustomText.headlineText(
                          text: '₹${hoarding.price}/mo',
                          color: const Color(0xFF1E1B18),
                        )),
                      );
  }
}