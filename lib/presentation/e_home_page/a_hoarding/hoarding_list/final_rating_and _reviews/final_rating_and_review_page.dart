import 'package:dotted_border/dotted_border.dart';
import 'package:oohapp/presentation/e_home_page/a_hoarding/hoarding_list/data_model/hoarding_list_data_mode.dart';
import 'package:oohapp/presentation/e_home_page/a_hoarding/hoarding_list/final_rating_and%20_reviews/widgets/conclusion_rating_box.dart';
import 'package:oohapp/widgets/custom_spacer_widget/long_seprated_line.dart';
import 'package:oohapp/presentation/e_home_page/a_hoarding/hoarding_list/final_rating_and%20_reviews/widgets/rating_contaiber.dart';
import 'package:oohapp/presentation/e_home_page/a_hoarding/hoarding_list/final_rating_and%20_reviews/widgets/show_bottom_sheet_sort_option.dart';
import 'package:oohapp/presentation/e_home_page/a_hoarding/hoarding_list/final_rating_and%20_reviews/widgets/show_review_delete_option.dart';
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
  void showReviewDeleteOptionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ReviewDeleteOptionSheet();
      },
    );
  }

  void _showSortingBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ShowSortBottomOption();
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
            onPressed: () {
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
              RatingContainerWidget(),
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
                  ConclusionRatingContainer(),
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
                  SizedBox(
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
                                  width: size.width * 0.17,
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
                        const NeverScrollableScrollPhysics(), 
                    itemCount: widget.hoarding.reviews
                        .length,
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
                                                  onTap: () {
                                                    showReviewDeleteOptionSheet(
                                                        context);
                                                  },
                                                  child: Container(
                                                      width: 25,
                                                      height: 24,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: CustomImageView(
                                                          imagePath:
                                                              ImageConstant
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
                                                            3) 
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
                            LongSepratedLine(),
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
}
