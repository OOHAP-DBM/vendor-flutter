import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oohapp/presentation/f_my_hoarding_screen/widget/booked_hoarding_card.dart';
import 'package:oohapp/presentation/f_my_hoarding_screen/widget/booking_progress/booking_progress_timeline_two.dart';
import 'package:oohapp/presentation/f_my_hoarding_screen/widget/booking_progress_line.dart';
import 'package:oohapp/presentation/f_my_hoarding_screen/widget/custom_booking_progress_bar.dart';
import 'package:oohapp/widgets/custom_appbar/detail_screen_app_bar.dart';
import 'package:oohapp/widgets/custom_buttons/custom_text_btn.dart';
import 'package:timeline_tile/timeline_tile.dart';
import '../../../core/app_export.dart';
import '../widget/booking_progress/booking_progress_timeline_one.dart';
import '../widget/order_card.dart';
import '../widget/row_text_widget.dart';

class NewBooking extends StatefulWidget {
  const NewBooking({super.key});

  @override
  State<NewBooking> createState() => _NewBookingState();
}

class _NewBookingState extends State<NewBooking> {
  /// Show Booking components
  bool _isCardCollapse = false;

  double getTextWidth(String text, double fontSize) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: TextStyle(fontSize: fontSize)),
      textDirection: TextDirection.ltr,
    )..layout();
    return textPainter.width;
  }

  /// Current status of order card
  String _currentStatusValue = 'On Hold';

  Color _getTextColor(String value) {
    if (value == 'On Hold') {
      return Colors.orange;
    } else if (value == 'Accept') {
      return CustomColors.primaryGreen;
    } else if (value == 'Reject') {
      return Colors.red;
    } else if (value == 'Cancelled') {
      return Colors.red;
    } else {
      return Colors.orange; // Default color
    }
  }

  Color _getBackgroundColor(Color textColor) {
    return textColor.withOpacity(0.2);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      //  backgroundColor: Colors.grey[200],
      appBar: const DetailScreenAppBar(
        title: 'Booking Details',
        /* actions: [
          CircularButton(
            onPressed: () {},
            icon: Icons.more_vert_sharp,
            iconColor: const Color(0xFF282C3E),
          )
        ],*/
      ),
      body: SingleChildScrollView(
          //   padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // Shadow position - from top
                ),
              ],
            ),
            child: Column(
              children: [
                const BookedHordingCardWidget(
                  padding: EdgeInsets.zero,
                  imageUrl:
                      'https://images.unsplash.com/photo-1595378376639-2ff85917c511?q=80&w=1965&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  hoardingLocation: 'Polytechnic Chauraha,',
                  hoardingCity: 'Gomtinagar Lucknow',
                  hoardingType: 'LED Hoarding',
                  hoardingScreenType: 'Hoarding Type: ',
                  shadowColor: Colors.transparent,
                ),
                SizedBox(
                  height: 3.h,
                ),
                Container(
                  color: Colors.grey[200],
                  height: 1.5.h,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText.text(
                        text: 'Current Status:',
                        color: CustomColors.mediumGrey,
                        fontSize: 15.sp),
                    CustomText.text(
                        text: 'On Hold',
                        color: CustomColors.blackColor,
                        fontSize: 15.sp),
                  ],
                ),
              ],
            ),
          ),

          // Timeline

          SizedBox(
            height: 10.h,
          ),

          // Timeline will here

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.w),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                  color: Colors.yellow.withOpacity(0.2),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText.text(
                              text: 'Booking Status of all Hoardings',
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600),
                          IconButton(
                            iconSize: 30.w,
                            color: CustomColors.buttonGreen,
                            onPressed: () {
                              setState(() {
                                _isCardCollapse = !_isCardCollapse;
                              });
                            },
                            icon: _isCardCollapse
                                ? const Icon(Icons.keyboard_arrow_up_sharp)
                                : const Icon(Icons.keyboard_arrow_down_sharp),
                          )
                        ],
                      ),
                      _isCardCollapse
                          ? Column(
                              children: [
                                SizedBox(
                                  height: 10.h,
                                ),
                                LinearBookingProgress(
                                    progressBarWidth: size.width),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Container(
                                  color: Colors.black.withOpacity(0.5),
                                  height: 1.5.h,
                                ),
                                const BookingProgressTimelineOne(
                                  isFirst: true,
                                  isLast: false,
                                  progressTitle: 'Booking Received',
                                ),
                                const BookingProgressTimelineTwo(
                                  progressTitle: 'Booking On hold',
                                ),
                                BookingProgressTimelineOne(
                                  isFirst: false,
                                  isLast: true,
                                  iconData: Icons.done_all,
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.w),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: _getBackgroundColor(
                                                _getTextColor(
                                                    _currentStatusValue)),
                                            width: 2.w),
                                        //  border: Border.all(color: Colors.orange),
                                        borderRadius:
                                            BorderRadius.circular(5.r)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText.text(
                                            text: _currentStatusValue,
                                            color: _getTextColor(
                                                _currentStatusValue),
                                            fontSize: 14.sp),
                                        PopupMenuButton<String>(
                                          surfaceTintColor: Colors.white,
                                          elevation: 5,
                                          onSelected: (value) {
                                            setState(() {
                                              _currentStatusValue = value;
                                            });
                                          },
                                          icon: const Icon(
                                              Icons.arrow_drop_down_outlined),
                                          itemBuilder: (BuildContext context) =>
                                              <PopupMenuEntry<String>>[
                                            PopupMenuItem<String>(
                                                value: 'On Hold',
                                                child: CustomText.text(
                                                  text: 'On Hold',
                                                  color: Colors.orange,
                                                )),
                                            PopupMenuItem<String>(
                                              value: 'Accept',
                                              child: CustomText.text(
                                                text: 'Accept',
                                                color:
                                                    CustomColors.primaryGreen,
                                              ),
                                            ),
                                            PopupMenuItem<String>(
                                              value: 'Cancelled',
                                              child: CustomText.text(
                                                text: 'Cancelled',
                                                color: Colors.red,
                                              ),
                                            ),
                                            PopupMenuItem<String>(
                                              value: 'Reject',
                                              child: CustomText.text(
                                                text: 'Reject',
                                                color: Colors.red,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  color: Colors.grey[300],
                                  height: 1.0.h,
                                ),
                                SizedBox(
                                  height: 7.h,
                                ),
                                const RowTextWidget(
                                  title: 'Campaign Starts Date',
                                  subTitle: 'Nov 23, 2023',
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                const RowTextWidget(
                                  title: 'Campaign End Date',
                                  subTitle: 'Dec 23, 2023',
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                const RowTextWidget(
                                  title: 'Booking ID',
                                  subTitle: '#5616464d1SCS',
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                const RowTextWidget(
                                  title: 'Tracking Number',
                                  subTitle: '5616464d1SCS',
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                              ],
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Container(
                  color: Colors.grey[300],
                  height: 1.0.h,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: CustomText.text(
                    text: 'Customer Details:',
                    fontWeight: FontWeight.w600,
                    fontSize: 15.sp,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                const RowTextWidget(
                  title: 'Contact Number',
                  subTitle: '+91 9898989898',
                  fontWeight: FontWeight.normal,
                ),
                SizedBox(
                  height: 5.h,
                ),
                const RowTextWidget(
                  title: 'Email Address',
                  subTitle: 'Customer@gmail.com',
                  fontWeight: FontWeight.normal,
                ),
                SizedBox(
                  height: 5.h,
                ),
                const RowTextWidget(
                  title: 'Customer ID',
                  subTitle: '51425869',
                  fontWeight: FontWeight.normal,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  color: Colors.grey[300],
                  height: 1.0.h,
                ),
                SizedBox(
                  height: 15.h,
                ),
                CustomButton(
                  text: 'Go to chat group',
                  onTap: () {},
                  backgroundColor: CustomColors.buttonColor,
                ),
                CustomTextBtn(
                  onPressed: (){},
                  text: 'View Invoice',
                  textColor: Colors.blue,
                  fontSize: 16.sp,
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
