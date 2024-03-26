import '../../../core/app_export.dart';
import '../../../widgets/custom_buttons/custom_text_btn.dart';

class AppointmentMeeting extends StatelessWidget {
  final void Function() remindMe;
  final void Function() joinMeeting;
  final void Function() copyMeetUrl;
  final String? meetUrl;

  const AppointmentMeeting(
      {super.key,
      required this.remindMe,
      required this.joinMeeting,
      required this.copyMeetUrl,
      this.meetUrl});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
    //  padding: EdgeInsets.all(15.r),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35.r), topRight: Radius.circular(35.r))),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText.text(
                    text: 'Appointment Meeting',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400),
                Icon(
                  Icons.more_horiz_outlined,
                  color: CustomColors.buttonGreen,
                  size: 30.sp,
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: Icon(
                    Icons.format_paint,
                    color: CustomColors.supportiveColor,
                    size: 22.sp,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText.text(
                          text:
                              'Graphics Confirmation Meeting with Graphics Designer',
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomText.text(
                          text: 'Saturday, 28 Oct. 7 - 7:30 PM',
                          fontSize: 14.sp,
                          color: CustomColors.mediumBlack,
                          fontWeight: FontWeight.w300),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: CustomColors.buttonGreen,
                  size: 25.sp,
                ),
                SizedBox(
                  width: 7.w,
                ),
                CustomTextBtn(
                    onPressed: copyMeetUrl,
                    text: meetUrl ?? 'meet.google.com/4584scs85c',
                    fontSize: 15.sp,
                    textColor: Colors.blue,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w300),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.notifications_none,
                  color: CustomColors.buttonGreen,
                  size: 25.sp,
                ),
                SizedBox(
                  width: 7.w,
                ),
                CustomText.text(
                    text: '30 minutes Before',
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w300),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.group_outlined,
                  color: CustomColors.buttonGreen,
                  size: 25.sp,
                ),
                SizedBox(
                  width: 7.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomText.text(
                        text: '3 Guest',
                        fontSize: 14.sp,
                        color: CustomColors.mediumBlack,
                        fontWeight: FontWeight.w300),
                    CustomText.text(
                        text: 'Graphics designer',
                        fontSize: 15.sp,
                        color: Colors.blue,
                        fontWeight: FontWeight.w400),
                    CustomText.text(
                        text: 'Vendor',
                        fontSize: 15.sp,
                        color: Colors.blue,
                        fontWeight: FontWeight.w400),
                    CustomText.text(
                        text: 'Admin',
                        fontSize: 15.sp,
                        color: Colors.blue,
                        fontWeight: FontWeight.w400),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.person_outline,
                  color: CustomColors.buttonGreen,
                  size: 25.sp,
                ),
                SizedBox(
                  width: 7.w,
                ),
                CustomText.text(
                    text: 'Organized by Calendar- invite@OOhapp',
                    fontSize: 14.sp,
                    color: CustomColors.mediumBlack,
                    fontWeight: FontWeight.w300),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomButton(onTap: joinMeeting, text: 'Join Meeting'),
            SizedBox(
              height: 10.h,
            ),
            Align(
              alignment: Alignment.center,
              child: CustomTextBtn(
                onPressed: remindMe,
                text: 'Remind me before 30 mints',
                textColor: CustomColors.buttonGreen,
                decoration: TextDecoration.underline,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
