import '../../../core/app_export.dart';
import '../../../widgets/custom_buttons/custom_text_btn.dart';

class AppointmentWidget extends StatelessWidget {
  const AppointmentWidget({
    super.key,
    this.scheduleTime = '9:00 PM',
    this.professionPerson = 'Graphics confirmation',
    this.dateMonthYear = 'Monday,17 June,2024',
    this.timeFromTo = '8:00 PM - 9:00 PM',
    this.borderColor = Colors.transparent,
    required this.joinCall,
    required this.isShowDivider,
  });

  final String scheduleTime;
  final String professionPerson;
  final String dateMonthYear;
  final String timeFromTo;
  final Color borderColor;
  final void Function() joinCall;
  final bool isShowDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8.r),
          decoration: BoxDecoration(
              color: CustomColors.buttonGreen.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: borderColor,
              )),
          child: Row(
            children: [
              RotatedBox(
                quarterTurns: 3,
                child: CustomText.text(
                  text: scheduleTime,
                  fontWeight: FontWeight.w600,
                  fontSize: 13.sp,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10.r),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText.text(
                            text: 'Graphics confirmation',
                            fontWeight: FontWeight.w600,
                            fontSize: 15.sp,
                          ),
                          CustomTextBtn(
                            text: 'Join call',
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            textColor: CustomColors.buttonGreen,
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.person,
                            color: CustomColors.mediumBlack,
                            size: 16.sp,
                          ),
                          SizedBox(width: 3.w),
                          CustomText.text(
                            text: professionPerson,
                            fontSize: 11.5.sp,
                            fontWeight: FontWeight.w600,
                            color: CustomColors.mediumBlack,
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.calendar_month_sharp,
                            color: CustomColors.mediumBlack,
                            size: 16.sp,
                          ),
                          SizedBox(width: 3.w),
                          CustomText.text(
                            text: dateMonthYear,
                            fontSize: 11.5.sp,
                            fontWeight: FontWeight.w600,
                            color: CustomColors.mediumBlack,
                          ),
                          SizedBox(width: 10.w),
                          Icon(
                            Icons.access_time_rounded,
                            color: CustomColors.mediumBlack,
                            size: 16.sp,
                          ),
                          SizedBox(width: 3.w),
                          CustomText.text(
                            text: timeFromTo,
                            fontSize: 11.5.sp,
                            fontWeight: FontWeight.w600,
                            color: CustomColors.mediumBlack,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        isShowDivider
            ? Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Container(
            width: double.infinity,
            height: 3,
            color: CustomColors.grey.withOpacity(0.2),
          ),
        )
            : const SizedBox.shrink(),
      ],
    );
  }
}
