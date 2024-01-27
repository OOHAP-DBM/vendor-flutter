import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:oohapp/presentation/e_home_page/a_hoarding/hoarding_list/data_model/hoarding_list_data_mode.dart';
import 'package:oohapp/presentation/e_home_page/a_hoarding/hoarding_list/widgets/custom_rating_display_box.dart';

import '../../../../../core/app_export.dart';

enum SortOption { latestFirst, positiveFirst, negativeFirst }

class FinalRatingAndReviewPage extends StatefulWidget {
  final Hoarding hoarding;
  const FinalRatingAndReviewPage({super.key, required this.hoarding});

  @override
  State<FinalRatingAndReviewPage> createState() =>
      _FinalRatingAndReviewPageState();
}

class _FinalRatingAndReviewPageState extends State<FinalRatingAndReviewPage> {
  late List<bool> _textFieldVisibilityStates;

  @override
  void initState() {
    super.initState();

    _textFieldVisibilityStates =
        List<bool>.filled(widget.hoarding.reviews.length, false);
  }

  bool _isTextFieldVisible = false;
  bool _isTyping = false;
  TextEditingController _controller = TextEditingController();
  bool isDescriptionExpanded = false;

  SortOption _selectedSortOption = SortOption.latestFirst; // Default value

  void _showreviewdeleteoptionsheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            width: double.infinity,
            height: 200,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(19),
                  topRight: Radius.circular(19),
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 10,left: 39,right: 39,bottom: 24),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText.subHeadingText(
                   text: 'Are you sure you want to delete \nreviews?',
                   color:   Color(0xFF282C3E)
                  ),
                  SizedBox(height: 12,),
                  CustomButton(onTap: (){
                    Navigator.pop(context);
                  }, text: 'Cancel',
                  backgroundColor: Color(0xFF282C3E),
                  width: double.infinity,),
                  SizedBox(height: 12,),
                   CustomButton(onTap: (){
                    Navigator.pop(context);
                  }, text: 'Yes',
                  width: double.infinity,),
                ],
              ),
            ),
          );
        });
  }

  void _showSortingBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
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

                        Navigator.pop(context); // Dismiss the bottom sheet
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 160,
                width: double.infinity,
                decoration: const BoxDecoration(color: Colors.white),
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
                          height: 146,
                          decoration: const ShapeDecoration(
                            color: Color(0xFF0089E1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(6),
                                bottomLeft: Radius.circular(6),
                              ),
                            ),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment
                                .center, // Aligns children to the center
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '4.0/5',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                              Text(
                                'Excellent',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: ListView(
                            children: [
                              _buildRatingRow('Excellent', 0.59, Colors.blue),
                              _buildRatingRow('Very Good', 0.23, Colors.blue),
                              _buildRatingRow('Average', 0.08, Colors.blue),
                              _buildRatingRow('Poor', 0.04, Colors.blue),
                              _buildRatingRow('Bad', 0.06, Colors.blue),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText.secondaryTitle(
                    text: 'All ${widget.hoarding.reviews.length} Reviews',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  Container(
                    width: 90,
                    height: 35,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Color(0xFFECECEC)),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Latest first',
                          style: TextStyle(
                            color: Color(0xFF282C3E),
                            fontSize: 10,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 0,
                            letterSpacing: 0.50,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _showSortingBottomSheet(context);
                          },
                          child: SizedBox(
                            width: 24,
                            height: 20,
                            child: CustomImageView(
                                imagePath: ImageConstant.arrowdropdownicon,
                                fit: BoxFit.cover),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText.secondaryTitle(
                    text: 'Reviews & Rating',
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FinalRatingAndReviewPage(
                              hoarding: widget.hoarding),
                        ),
                      );
                    },
                    child: Container(
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
                                            text:
                                                'User Reviews and 3256 Ratings',
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
                    itemCount: widget.hoarding.reviews
                        .length, // Only show the first two reviews
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
                                                GestureDetector(
                                                  onTap: (){
                                                    _showreviewdeleteoptionsheet(context);
                                                  },
                                                  child: Container(
                                                      width: 25,
                                                      height: 24,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: CustomImageView(
                                                          imagePath: ImageConstant
                                                              .deleteicon,
                                                          fit: BoxFit.cover)),
                                                )
                                              ],
                                            ),
                                            const SizedBox(height: 9),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 16),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 21,
                                                    height: 17,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration:
                                                        const BoxDecoration(),
                                                    child: CustomImageView(
                                                      imagePath: ImageConstant
                                                          .textshowicon,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 2),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
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
                                                          style:
                                                              const TextStyle(
                                                            color: Color(
                                                                0xFF6A6A6A),
                                                            fontSize: 14,
                                                            fontFamily:
                                                                'Poppins',
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
                                                              style:
                                                                  const TextStyle(
                                                                color: Color(
                                                                    0xFF009A5C),
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                _textFieldVisibilityStates[
                                                        index] =
                                                    !_textFieldVisibilityStates[
                                                        index];
                                              });
                                            },
                                            child: Container(
                                                alignment: Alignment.topRight,
                                                width: 25,
                                                height: 24,
                                                clipBehavior: Clip.antiAlias,
                                                decoration:
                                                    const BoxDecoration(),
                                                child: CustomImageView(
                                                    imagePath: ImageConstant
                                                        .messageicon,
                                                    fit: BoxFit.cover)),
                                          ),
                                        ],
                                      ),
                                      _textFieldVisibilityStates[index]
                                          ? Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 12),
                                              child: Stack(
                                                alignment: Alignment.topRight,
                                                children: [
                                                  DottedBorder(
                                                    color: Colors.grey,
                                                    borderType:
                                                        BorderType.RRect,
                                                    radius:
                                                        const Radius.circular(
                                                            6),
                                                    padding: EdgeInsets.zero,
                                                    dashPattern: [6, 4],
                                                    strokeWidth: 2,
                                                    child: Container(
                                                      width: double.infinity,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4),
                                                      child: TextField(
                                                        controller: _controller,
                                                        maxLines: 3,
                                                        decoration:
                                                            const InputDecoration(
                                                          hintText:
                                                              'Vendor reply...',
                                                          hintStyle: TextStyle(
                                                            color: Color(
                                                                0xFF999999),
                                                            fontSize: 14,
                                                            fontFamily:
                                                                'Poppins',
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            height: 0,
                                                          ),
                                                          border: InputBorder
                                                              .none, // Removes underline
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .symmetric(
                                                            vertical: 10.0,
                                                            horizontal: 10.0,
                                                          ),
                                                        ),
                                                        onChanged: (text) {
                                                          setState(() {
                                                            _isTyping =
                                                                text.isNotEmpty;
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
                                                          _isTextFieldVisible =
                                                              false;
                                                          _isTyping = false;
                                                        });
                                                      },
                                                      child: Text(
                                                        'Done',
                                                        style: TextStyle(
                                                          color: _isTyping
                                                              ? Colors.black
                                                              : const Color(
                                                                  0xFF999999),
                                                          fontSize: 14,
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          letterSpacing: 0.50,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRatingRow(String label, double value, Color color) {
    return Row(
      crossAxisAlignment:
          CrossAxisAlignment.center, // Aligns children vertically center
      children: [
        SizedBox(
          width:
              70, // Set a fixed width for the label to align the start of the progress bars
          child: Text(
            label,
            style: const TextStyle(
              color: Color(0xFF282C3E),
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Stack(
              children: <Widget>[
                Container(
                  width:
                      115, // Ensures the background takes up all available space
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                Container(
                  width:
                      115 * value, // Adjusts the width according to the value
                  height: 4,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ],
            ),
          ),
        ),
        Text('${(value * 100).toInt()}%',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Poppins',
            )),
      ],
    );
  }
}
