import 'package:flutter/material.dart';

import '../../../../../core/app_export.dart';

class FinalRatingAndReviewPage extends StatefulWidget {
  const FinalRatingAndReviewPage({super.key});

  @override
  State<FinalRatingAndReviewPage> createState() =>
      _FinalRatingAndReviewPageState();
}

class _FinalRatingAndReviewPageState extends State<FinalRatingAndReviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Business Details',
        centerTitle: true,
        elevation: 1,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: CircularButton(
            onTap: () {
              Navigator.pop(context);
            },
            backgroundColor: CustomColors.grey,
            borderColor: CustomColors.transparent,
            icon: Icons.arrow_back,
            iconColor: CustomColors.blackColor,
          ),
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 135,
              width: double.infinity,
              child: Card(
                elevation: 2.0,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 18, top: 12, bottom: 12, right: 18),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 112,
                        height: 106,
                        decoration: ShapeDecoration(
                          color: Color(0xFF0089E1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(6),
                              bottomLeft: Radius.circular(6),
                            ),
                          ),
                        ),
                        child: Center(
                          child: Column(
                               children: [
                                
                               ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
