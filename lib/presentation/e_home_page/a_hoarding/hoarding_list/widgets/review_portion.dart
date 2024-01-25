import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:oohapp/core/app_export.dart';
import 'package:oohapp/core/utils/image_constant.dart';
import 'package:oohapp/presentation/e_home_page/a_hoarding/hoarding_list/data_model/hoarding_list_data_mode.dart';
import 'package:oohapp/presentation/e_home_page/a_hoarding/hoarding_list/widgets/custom_rating_display_box.dart';

import '../../../../../widgets/custom_text.dart';

class ReviewPortionPage extends StatefulWidget {
  final Hoarding hoarding;
  const ReviewPortionPage({super.key, required this.hoarding});

  @override
  State<ReviewPortionPage> createState() => _ReviewPortionPageState();
}

class _ReviewPortionPageState extends State<ReviewPortionPage> {
  bool _isTextFieldVisible = false;
  bool _isTyping = false;
  TextEditingController _controller = TextEditingController();
  bool isDescriptionExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFF282C3E)),
          borderRadius: BorderRadius.circular(9),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x0C000000),
            blurRadius: 6,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ],
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 12, left: 12, right: 12, bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText.secondaryTitle(
              text: 'Reviews & Rating',
              color: Colors.black,
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              width: double.infinity,
              height: 48,
              decoration: ShapeDecoration(
                color: const Color(0xFFF5F5F6),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                        child: RatingBadge(
                            ratingText: '4.0',
                            textColor: Colors.white,
                            iconColor: Colors.white,
                            backgroundColor: Colors.blue)),
                    const SizedBox(
                      width: 6,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Excellent',
                              style: TextStyle(
                                color: Color(0xFF0089E1),
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 0,
                                letterSpacing: 0.50,
                              ),
                            ),
                            CustomText.subHeadingText(
                              text: '(2423 Ratings)',
                              color: const Color(0xFF282C3E),
                            )
                          ],
                        ),
                        const Row(
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: '1526',
                                    style: TextStyle(
                                      color: Color(0xFF282C3E),
                                      fontSize: 12,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                      letterSpacing: 0.50,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' ',
                                    style: TextStyle(
                                      color: Color(0xFF282C3E),
                                      fontSize: 12,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w300,
                                      height: 0,
                                      letterSpacing: 0.50,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'User Reviews and 3256 Ratings',
                                    style: TextStyle(
                                      color: Color(0xFF282C3E),
                                      fontSize: 12,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                      letterSpacing: 0.50,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    const Spacer(), // This will push the following widgets to the end of the row
                    IconButton(
                      onPressed: () {
                        // Navigator.pushNamed(context,
                        //     Routes.firsthoardinglocationScreen);
                      },
                      icon: Image.asset(
                        ImageConstant.rightarrowicon,
                        width:
                            26, // You can set the width of the image if necessary
                        height: 26,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Customer Photos & Reviews',
              style: TextStyle(
                color: Color(0xFF282C3E),
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              height: 70,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.hoarding.reviews.length,
                itemBuilder: (context, index) {
                  var images = widget.hoarding.reviews[index].imagePath;
                  return Row(
                    children: images!.map((imagePath) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            imagePath,
                            width: ScaleSize.width(17),
                            height: 58,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics:
                  const NeverScrollableScrollPhysics(), // to disable ListView's scrolling
              itemCount: widget.hoarding.reviews.length
                  .clamp(0, 2), // Only show the first two reviews
              itemBuilder: (context, index) {
                var review = widget.hoarding.reviews[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                review.name,
                                style: const TextStyle(
                                  color: Color(0xFF282C3E),
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                  letterSpacing: 0.50,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                review.date,
                                style: const TextStyle(
                                  color: Color(0xFF282C3E),
                                  fontSize: 10,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w300,
                                  height: 0,
                                  letterSpacing: 0.50,
                                ),
                              )
                            ],
                          ),
                          const Spacer(),
                          RatingBadge(
                            ratingText: review.rating.toString(),
                            textColor: Colors.blue,
                            iconColor: Colors.blue,
                            backgroundColor: Colors.white,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          review.comment,
                          style: const TextStyle(
                            color: Color(0xFF282C3E),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w300,
                            height: 0,
                          ),
                        ),
                      ),
                      (review.vendorreply != null &&
                              review.vendorreply!.isNotEmpty)
                          ? Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(4),
                                  decoration: const BoxDecoration(
                                      color: Color(0xFFF5F5F6)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Vendor Response',
                                            style: TextStyle(
                                              color: Color(0xFF282C3E),
                                              fontSize: 12,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                          const Spacer(),
                                          Container(
                                              width: 25,
                                              height: 24,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: const BoxDecoration(),
                                              child: CustomImageView(
                                                  imagePath:
                                                      ImageConstant.deleteicon,
                                                  fit: BoxFit.cover))
                                        ],
                                      ),
                                      const SizedBox(height: 9),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 16),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 21,
                                              height: 17,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: const BoxDecoration(),
                                              child: CustomImageView(
                                                imagePath:
                                                    ImageConstant.textshowicon,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            const SizedBox(width: 2),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    review.vendorreply!,
                                                    maxLines:
                                                        isDescriptionExpanded
                                                            ? null
                                                            : 3,
                                                    overflow:
                                                        isDescriptionExpanded
                                                            ? TextOverflow
                                                                .visible
                                                            : TextOverflow
                                                                .ellipsis,
                                                    style: const TextStyle(
                                                      color: Color(0xFF6A6A6A),
                                                      fontSize: 14,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  if (review.vendorreply!
                                                          .split('\n')
                                                          .length >
                                                      3) // Check if the text exceeds three lines
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          isDescriptionExpanded =
                                                              !isDescriptionExpanded;
                                                        });
                                                      },
                                                      child: Text(
                                                        isDescriptionExpanded
                                                            ? 'Read less'
                                                            : 'Read more',
                                                        style: const TextStyle(
                                                          color:
                                                              Color(0xFF009A5C),
                                                          fontSize: 14,
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Edit',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        color: Color(0xFF282C3E),
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                        letterSpacing: 0.50,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _isTextFieldVisible =
                                              !_isTextFieldVisible;
                                        });
                                      },
                                      child: Container(
                                          alignment: Alignment.topRight,
                                          width: 25,
                                          height: 24,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: const BoxDecoration(),
                                          child: CustomImageView(
                                              imagePath:
                                                  ImageConstant.messageicon,
                                              fit: BoxFit.cover)),
                                    ),
                                  ],
                                ),
                                _isTextFieldVisible
                                    ? Stack(
                                        alignment: Alignment.topRight,
                                        children: [
                                          DottedBorder(
                                            color: Colors.grey,
                                            borderType: BorderType.RRect,
                                            radius: const Radius.circular(6),
                                            padding: EdgeInsets.zero,
                                            dashPattern: [6, 4],
                                            strokeWidth: 2,
                                            child: Container(
                                              width: double.infinity,
                                              padding: const EdgeInsets.all(4),
                                              child: TextField(
                                                controller: _controller,
                                                maxLines: 3,
                                                decoration:
                                                    const InputDecoration(
                                                  hintText: 'Vendor reply...',
                                                  hintStyle: TextStyle(
                                                    color: Color(0xFF999999),
                                                    fontSize: 14,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w300,
                                                    height: 0,
                                                  ),
                                                  border: InputBorder
                                                      .none, // Removes underline
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                    vertical: 10.0,
                                                    horizontal: 10.0,
                                                  ),
                                                ),
                                                onChanged: (text) {
                                                  setState(() {
                                                    _isTyping = text.isNotEmpty;
                                                  });
                                                },
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            right: 10,
                                            bottom: 10,
                                            child: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  _isTextFieldVisible = false;
                                                  _isTyping = false;
                                                });
                                              },
                                              child: Text(
                                                'Done',
                                                style: TextStyle(
                                                  color: _isTyping
                                                      ? Colors.black
                                                      : const Color(0xFF999999),
                                                  fontSize: 14,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: 0.50,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : Container()
                              ],
                            ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
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
                      )
                    ],
                  ),
                );
              },
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                'Read all ${widget.hoarding.reviews.length} Reviews',
                style: const TextStyle(
                  color: Color(0xFF009A5C),
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0,
                  letterSpacing: 0.50,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
