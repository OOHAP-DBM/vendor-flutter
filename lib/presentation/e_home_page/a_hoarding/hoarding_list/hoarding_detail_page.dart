import 'package:carousel_slider/carousel_slider.dart';

import 'package:oohapp/presentation/e_home_page/a_hoarding/hoarding_list/data_model/hoarding_list_data_mode.dart';
import 'package:oohapp/presentation/e_home_page/a_hoarding/hoarding_list/widgets/recently_added_screen.dart';
import 'package:oohapp/presentation/e_home_page/a_hoarding/hoarding_list/widgets/review_portion.dart';

import '../../../../core/app_export.dart';

class MyHoardingDetailPage extends StatefulWidget {
  final Hoarding hoarding;

  const MyHoardingDetailPage({
    super.key,
    required this.hoarding,
  });

  @override
  State<MyHoardingDetailPage> createState() => _MyHoardingDetailPageState();
}

class _MyHoardingDetailPageState extends State<MyHoardingDetailPage> {
  String _getVisibilityText(int index) {
    switch (index) {
      case 0:
        return 'Metro view';
      case 1:
        return 'Bridge view';
      case 2:
        return 'Left side road';
      case 3:
        return 'Right side road';
      default:
        return '';
    }
  }

  String truncateWithEllipsis(String text, int wordLimit) {
    var wordList = text.split(' ');
    if (wordList.length > wordLimit) {
      return wordList.take(wordLimit).join(' ') + '...';
    } else {
      return text;
    }
  }

  bool isDescriptionExpanded = false;
  int _current = 0;
  final CarouselController _carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'My Hoarding',
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
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    clipBehavior: Clip.none,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.share,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: 24,
                    height: 24,
                    clipBehavior: Clip.none,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_vert,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              left: 16.0, right: 16.0, top: 32, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider.builder(
                carouselController: _carouselController,
                itemCount: widget.hoarding.imagePaths.length,
                options: CarouselOptions(
                  viewportFraction: 1.0,
                  autoPlay: false,
                  enlargeCenterPage: false,
                  height: 210,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
                itemBuilder: (context, index, realIdx) {
                  return Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: <Widget>[
                      Positioned.fill(
                        // Use Positioned.fill to provide bounded constraints
                        child: Image.asset(
                          widget.hoarding.imagePaths[index],
                          fit: BoxFit.cover,
                          height: 210,
                        ),
                      ),
                      Positioned(
                        bottom:
                            10, // Adjust this value to position the dots correctly
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: widget.hoarding.imagePaths
                              .asMap()
                              .entries
                              .map((entry) {
                            return GestureDetector(
                              onTap: () =>
                                  _carouselController.animateToPage(entry.key),
                              child: Container(
                                width: 12.0,
                                height: 12.0,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 4.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _current == entry.key
                                      ? Colors.green
                                      : Colors.white,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          width: 89,
                          height: 25,
                          decoration: BoxDecoration(
                            color: widget.hoarding.isPublished
                                ? const Color(0xFF009A5C)
                                : Colors.red, // Color based on published status
                            borderRadius: BorderRadius.circular(12.5),
                          ),
                          child: Center(
                            child: Text(
                              widget.hoarding.statusText,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 10,
                        bottom: 30,
                        child: Container(
                          width: 43,
                          height: 32,
                          decoration: ShapeDecoration(
                            color: Colors.black.withOpacity(0.699999988079071),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                          ),
                          child: Center(
                            child: Text(
                              '${index + 1}/${widget.hoarding.imagePaths.length}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
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
                  padding: const EdgeInsets.only(
                      top: 12, left: 12, right: 12, bottom: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText.secondaryTitle(
                          text: widget.hoarding.title,
                          color: const Color(0xFF282C3E)),
                      const SizedBox(
                        height: 4,
                      ),
                      CustomText.subHeadingText(
                        text: widget.hoarding.location,
                        color: const Color(0xFF6A6A6A),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 17,
                            height: 21,
                            child: CustomImageView(
                              imagePath: ImageConstant.hoardingicon,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          CustomText.subHeadingText(
                            text: widget.hoarding.category,
                            color: const Color(0xFF282C3E),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          SizedBox(
                            width: 17,
                            height: 21,
                            child: CustomImageView(
                              imagePath: ImageConstant.measurementicon,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          CustomText.subHeadingText(
                            text: widget.hoarding.size,
                            color: const Color(0xFF282C3E),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFDFF2FF),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3)),
                        ),
                        child: Center(
                            child: CustomText.headlineText(
                          text: '₹${widget.hoarding.price}/mo',
                          color: const Color(0xFF1E1B18),
                        )),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        width: double.infinity,
                        height: 44,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFF5F5F6),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: CustomImageView(
                                imagePath: ImageConstant.mapicon,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 18),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment
                                  .center, // Align the column to center along the cross axis
                              children: [
                                Text(
                                  truncateWithEllipsis(
                                      widget.hoarding.exactloaction, 3),
                                  style: const TextStyle(
                                    color: Color(0xFF282C3E),
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.50,
                                  ),
                                ),
                                const Text(
                                  'View on Map',
                                  style: TextStyle(
                                    color: Color(0xFFFF8900),
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                    letterSpacing: 0.50,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(), // This will push the following widgets to the end of the row
                            IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context,
                                    Routes.firsthoardinglocationScreen);
                              },
                              icon: Image.asset(
                                ImageConstant.rightarrowicon,
                                width:
                                    26, // You can set the width of the image if necessary
                                height:
                                    26, 
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomText.secondaryTitle(
                          text: 'Description', color: Colors.black),
                      const SizedBox(height: 6),
                      Text(
                        widget.hoarding.description,
                        maxLines: isDescriptionExpanded ? null : 3,
                        overflow: isDescriptionExpanded
                            ? TextOverflow.visible
                            : TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Color(0xFF6A6A6A),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isDescriptionExpanded = !isDescriptionExpanded;
                          });
                        },
                        child: Text(
                          isDescriptionExpanded ? 'Read less' : 'Read more',
                          style: const TextStyle(
                            color: Color(0xFF009A5C),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      _buildInfoRow('Approved from Nagar Nigam',
                          widget.hoarding.approvedfromnagarnigam),
                      _buildInfoRow(
                          'Backlighting', widget.hoarding.backlighting),
                      _buildInfoRow('Printing & Mounting Service',
                          widget.hoarding.printingandmountingservice),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              strokeAlign: BorderSide.strokeAlignCenter,
                              color: Color(0xFFE0E0E0),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomText.secondaryTitle(
                          text: 'Target Audience', color: Colors.black),
                      const SizedBox(
                        height: 12,
                      ),
                      Wrap(
                        spacing: 12.0, // horizontal gap between chips
                        runSpacing: 12.0, // vertical gap between chips
                        children:
                            widget.hoarding.targetaudience.map((audience) {
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
                            onDeleted: () {
                              setState(() {
                                widget.hoarding.targetaudience.remove(audience);
                              });
                            },
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
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              strokeAlign: BorderSide.strokeAlignCenter,
                              color: Color(0xFFE0E0E0),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomText.secondaryTitle(
                        text: 'Hoarding Visibility',
                        color: Colors.black,
                      ),
                      const SizedBox(height: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                            widget.hoarding.hoardingvisibility.length, (index) {
                          bool isVisible =
                              widget.hoarding.hoardingvisibility[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  _getVisibilityText(index),
                                  style: const TextStyle(
                                    color: Color(0xFF282C3E),
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                                isVisible
                                    ? Container(
                                        width: 22,
                                        height: 22,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                        ),
                                        child: Icon(
                                          isVisible
                                              ? Icons.check_box
                                              : Icons.check_box_outline_blank,
                                          color: isVisible
                                              ? Colors.green
                                              : Colors.white,
                                        ),
                                      )
                                    : Container(
                                        width: 20,
                                        height: 20,
                                        decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              side: const BorderSide(
                                                  color: Colors.black)),
                                        ),
                                      ),
                              ],
                            ),
                          );
                        }),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              strokeAlign: BorderSide.strokeAlignCenter,
                              color: Color(0xFFE0E0E0),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomText.secondaryTitle(
                        text: 'Recently Booked By',
                        color: Colors.black,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                   RecentlyBookedSection(hoarding: widget.hoarding)
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              ReviewPortionPage(hoarding: widget.hoarding)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, String value) {
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
    );
  }
}
