import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:oohapp/presentation/e_home_page/a_hoarding/hoarding_list/final_rating_and%20_reviews/final_rating_and_review_page.dart';
import 'package:oohapp/widgets/custom_buttons/custom_button.dart';

class ShowSortBottomOption extends StatelessWidget {
  const ShowSortBottomOption({super.key});

  @override
  Widget build(BuildContext context) {
    SortOption _selectedSortOption = SortOption.latestFirst;
    return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Sort By',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  ListTile(
                    title: const Text('Latest First'),
                    leading: Radio<SortOption>(
                      value: SortOption.latestFirst,
                      groupValue: _selectedSortOption,
                      onChanged: (SortOption? value) {
                        setModalState(() {
                          _selectedSortOption = value!;
                        });
                      },
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text('Positive First'),
                    leading: Radio<SortOption>(
                      value: SortOption.positiveFirst,
                      groupValue: _selectedSortOption,
                      onChanged: (SortOption? value) {
                        setModalState(() {
                          _selectedSortOption = value!;
                        });
                      },
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text('Negative First'),
                    leading: Radio<SortOption>(
                      value: SortOption.negativeFirst,
                      groupValue: _selectedSortOption,
                      onChanged: (SortOption? value) {
                        setModalState(() {
                          _selectedSortOption = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: CustomButton(
                      width: 170,
                      onTap: () {
                        // Apply the filter for Published or Unpublished

                        Navigator.pop(context);
                      },
                      backgroundColor: Color(0xFF282C3E),
                      text: 'Apply',
                    ),
                  ),
                ],
              ),
            );
          },
        );
  }
}