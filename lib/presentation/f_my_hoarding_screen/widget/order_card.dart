import '../../../core/app_export.dart';
import 'custom_booking_progress_bar.dart';

class OrderCard extends StatelessWidget {
  const OrderCard(
      {super.key,
      required this.child,
      this.orderId = '#16449649',
      this.bookedBy = 'Customer Name',
      required this.currentStatusBgColor,
      this.edgeInsets});

  final Widget child;
  final String orderId;
  final String bookedBy;
  final Color currentStatusBgColor;
  final dynamic edgeInsets;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.all(8.0.r),
      decoration: BoxDecoration(
        //   color: Colors.pink,
        borderRadius: BorderRadius.circular(5.r),
        border: Border.all(color: CustomColors.grey),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText.text(text: 'ORDER ID', fontSize: 15.sp),
              CustomText.text(
                  text: orderId,
                  fontSize: 15.sp,
                  color: CustomColors.mediumGrey),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText.text(text: 'BOOKED BY', fontSize: 14.sp),
              CustomText.text(text: bookedBy, fontSize: 14.sp),
            ],
          ),
          SizedBox(
            height: 7.h,
          ),
          Container(
            color: Colors.grey[200],
            height: 1.5.h,
          ),
          SizedBox(
            height: 7.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText.text(
                  text: 'Campaign Duration:',
                  fontSize: 13.sp,
                  color: CustomColors.mediumGrey),
              SizedBox(
                height: 7.h,
              ),
              Row(
                //  mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      CustomText.text(
                          text: '01 May',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 1.sp, horizontal: 5.sp),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: Colors.black,
                          ),
                          child: CustomText.text(
                              text: '2024',
                              fontSize: 8.sp,
                              color: Colors.white)),
                    ],
                  ),
                  SizedBox(
                    width: 5.0.w,
                  ),
                  CustomBookingProgressBar(
                    width: size.width * 0.75,
                  ),
                  SizedBox(
                    width: 5.0.w,
                  ),

                  /// User Booking progress widget here

                  Column(
                    children: [
                      CustomText.text(
                          text: '01 Jun',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 1.sp, horizontal: 5.sp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: Colors.black,
                        ),
                        child: CustomText.text(
                            text: '2024', fontSize: 8.sp, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 7.h,
              ),
              Container(
                color: Colors.grey[200],
                height: 1.5.h,
              ),
              SizedBox(
                height: 7.h,
              ),
              CustomText.text(
                  text: 'Current Status:', fontSize: 12.sp, color: Colors.grey),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Container(
            width: size.width,
            alignment: Alignment.center,
            padding: edgeInsets ?? EdgeInsets.all(8.0.r),
            decoration: BoxDecoration(
              color: currentStatusBgColor,
              borderRadius: BorderRadius.circular(3.r),
            ),
            child: child,
          )
        ],
      ),
    );
  }
}
