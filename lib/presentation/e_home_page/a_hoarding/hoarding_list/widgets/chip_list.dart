import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:oohapp/presentation/e_home_page/a_hoarding/hoarding_list/data_model/hoarding_list_data_mode.dart';

class ChipListWidget extends StatelessWidget {
  final Hoarding hoarding;
  const ChipListWidget({super.key, required this.hoarding});

  @override
  Widget build(BuildContext context) {
    return          Wrap(
                        spacing: 12.0, // horizontal gap between chips
                        runSpacing: 12.0, // vertical gap between chips
                        children:
                            hoarding.targetaudience.map((audience) {
                          return Chip(
                            backgroundColor: const Color(0xFFD9F2E6),
                            label: Text(
                              audience,
                              style: const TextStyle(
                                color: Color(0xFF1E1B18),
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                           
                            deleteIcon: const Icon(
                              Icons.close,
                              size: 18,
                              color: Color(0xFF1E1B18),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: const BorderSide(
                                  color: Color(0xFFD9F2E6), width: 0),
                            ),
                          );
                        }).toList(),
                      );
  }
}