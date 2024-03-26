import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:oohapp/presentation/f_my_hoarding_screen/widget/booked_hoarding_card.dart';
import 'package:oohapp/presentation/f_my_hoarding_screen/widget/booking_progress/booking_progress_timeline_two.dart';
import 'package:oohapp/presentation/f_my_hoarding_screen/widget/booking_progress_line.dart';
import 'package:oohapp/presentation/f_my_hoarding_screen/widget/custom_booking_progress_bar.dart';
import 'package:oohapp/presentation/image_viewer/image_viewer_screen.dart';
import 'package:oohapp/widgets/custom_appbar/detail_screen_app_bar.dart';
import 'package:oohapp/widgets/custom_buttons/custom_text_btn.dart';
import 'package:timeline_tile/timeline_tile.dart';
import '../../../core/app_export.dart';
import '../widget/booking_progress/booking_progress_timeline_one.dart';
import '../widget/order_card.dart';
import '../widget/row_text_widget.dart';

class CancelledScreen extends StatefulWidget {
  const CancelledScreen({super.key});

  @override
  State<CancelledScreen> createState() => _CancelledScreenState();
}

class _CancelledScreenState extends State<CancelledScreen> {
  /// Show Booking components
  bool _isCardCollapse = false;

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
                        text: 'Cancelled',
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
                  color: Colors.red.withOpacity(0.1),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText.text(
                              text: 'Booking Status',
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
                                  progressTitle: 'Order Placed',
                                ),
                                const BookingProgressTimelineTwo(
                                  progressTitle: 'Waiting for Vendor Approval',
                                ),
                                BookingProgressTimelineOne(
                                  isFirst: false,
                                  isLast: false,
                                  iconData: Icons.clear,
                                  iconBackgroundColor: Colors.red,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText.text(
                                          text: 'Order Rejected',
                                          fontSize: 14.sp),
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.info_outline,
                                            color: Colors.blue,
                                          ))
                                    ],
                                  ),
                                ),
                                const BookingProgressTimelineTwo(
                                  progressTitle: 'Refund In Progress',
                                ),
                                const BookingProgressTimelineOne(
                                  isFirst: false,
                                  isLast: true,
                                  iconData: Icons.credit_card,
                                  progressTitle: 'Payment Refunded',
                                ),
                                SizedBox(
                                  height: 7.h,
                                ),
                                RowTextWidget(
                                  title: 'Refund Invoice:',
                                  subTitleChild: CustomTextBtn(
                                    text: 'Invoice',
                                    textColor: Colors.blue,
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.underline,
                                    underLineColor: Colors.blue,
                                    onPressed: () {},
                                  ),
                                ),

                                const RowTextWidget(
                                  title: 'Booking ID',
                                  subTitle: '5616464d1SCS',
                                ),
                                 RowTextWidget(
                                  title: 'Order Rejected'.toUpperCase(),
                                  titleColor:CustomColors.errorColor,
                                  subTitleChild: CustomTextBtn(
                                    text: 'Help ?',
                                    fontWeight: FontWeight.w600,
                                    onPressed: () {},
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
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
                  backgroundColor: CustomColors.buttonColor,
                  onTap: () {},
                ),
                CustomTextBtn(
                  onPressed: () {},
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
