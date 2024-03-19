import 'package:carousel_slider/carousel_slider.dart';

import 'package:oohapp/presentation/e_home_page/a_hoarding/hoarding_list/data_model/hoarding_list_data_mode.dart';
import 'package:oohapp/widgets/custom_spacer_widget/long_seprated_line.dart';
import 'package:oohapp/presentation/e_home_page/a_hoarding/hoarding_list/widgets/chip_list.dart';
import 'package:oohapp/presentation/e_home_page/a_hoarding/hoarding_list/widgets/custom_view_on_map_container.dart';
import 'package:oohapp/presentation/e_home_page/a_hoarding/hoarding_list/widgets/image_slider_widget.dart';
import 'package:oohapp/presentation/e_home_page/a_hoarding/hoarding_list/widgets/info_row_widget.dart';
import 'package:oohapp/presentation/e_home_page/a_hoarding/hoarding_list/widgets/price_show_container_widget.dart';
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

  bool isDescriptionExpanded = false;

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
            onPressed: () {
              Navigator.pop(context);
            },
            backgroundColor: CustomColors.grey,
            borderColor: CustomColors.transparent,
            icon: Icons.arrow_back,
            iconColor: CustomColors.blackColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              color: Colors.black,
            ),
          ),
          PopupMenuButton<String>(
            color: Colors.white,
            onSelected: (String value) {},
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Contact Support',
                textStyle: TextStyle(color: Colors.black),
                child: Text('Contact Support'),
              ),
              const PopupMenuItem<String>(
                value: 'Give Feedback',
                textStyle: TextStyle(color: Colors.black),
                child: Text('Give Feedback'),
              ),
              const PopupMenuItem<String>(
                value: 'Export as PDF',
                textStyle: TextStyle(color: Colors.black),
                child: Text('Export as PDF'),
              ),
            ],
            child: const Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              left: 16.0, right: 16.0, top: 32, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSliderWidget(hoarding: widget.hoarding),
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
                      PriceShowContainer(hoarding: widget.hoarding),
                      const SizedBox(
                        height: 12,
                      ),
                      ViewOnMapContainerWidget(hoarding: widget.hoarding),
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
                      InfoRowWidget(
                          title: 'Approved from Nagar Nigam',
                          value: widget.hoarding.approvedfromnagarnigam),
                      InfoRowWidget(
                          title: 'Backlighting',
                          value: widget.hoarding.backlighting),
                      InfoRowWidget(
                          title: 'Printing & Mounting Service',
                          value: widget.hoarding.printingandmountingservice),
                      const SizedBox(
                        height: 12,
                      ),
                      LongSepratedLine(),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomText.secondaryTitle(
                          text: 'Target Audience', color: Colors.black),
                      const SizedBox(
                        height: 12,
                      ),
                      ChipListWidget(hoarding: widget.hoarding),
                      const SizedBox(
                        height: 12,
                      ),
                      LongSepratedLine(),
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
                      LongSepratedLine(),
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
}
