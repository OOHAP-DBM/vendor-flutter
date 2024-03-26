import 'package:flutter/services.dart';
import 'package:oohapp/presentation/g_appointment_screen/widget/appointment_meeting.dart';
import 'package:oohapp/widgets/custom_appbar/detail_screen_app_bar.dart';
import 'package:oohapp/widgets/custom_network_cache_image.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/app_export.dart';

class AppointmentDetail extends StatefulWidget {
  const AppointmentDetail({super.key});

  @override
  State<AppointmentDetail> createState() => _AppointmentDetailState();
}

class _AppointmentDetailState extends State<AppointmentDetail> {
  String imageUrl =
      'https://images.unsplash.com/photo-1708616748538-bdd66d6a9e25?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';

  final String _meetUrl = 'https://meet.google.com/ycp-yvjg-trj';

  Future<void> _openMeetUrl(BuildContext context) async {
    var url = Uri.parse(_meetUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
      if (context.mounted) {
        await CustomSnackBar.showCustomSnackBar(context, 'Opening browser...');
      }
    } else {
      if (context.mounted) {
        CustomSnackBar.showCustomSnackBar(context, 'Could not launch $url');
      }
      throw 'Could not launch $url';
    }
  }

  /// function for the copy meet link

  void _copyMeetLink() {
    Clipboard.setData(ClipboardData(text: _meetUrl));
    CustomSnackBar.showCustomSnackBar(context, 'Url copied $_meetUrl',
        second: 3, backgroundColor: Colors.blue);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      //  backgroundColor: Colors.grey[200],
      appBar: const DetailScreenAppBar(
        title: 'Appointment',
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText.text(
                  text: 'Booked Hoarding', fontWeight: FontWeight.w600),
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 180.h,
                width: size.width,
                decoration: BoxDecoration(
                    color: Colors.red[200],
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: const ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: CustomCachedNetworkImage(
                      imageUrl:
                          'https://images.unsplash.com/photo-1496442226666-8d4d0e62e6e9?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  CustomText.text(text: 'Hazratganj Chauraha', fontSize: 15.sp),
                  Spacer(),
                  Icon(
                    Icons.star_outlined,
                    size: 17.w,
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  CustomText.text(
                    text: '4.5',
                    fontWeight: FontWeight.w600,
                  ),
                  CustomText.text(
                    text: '(240)',
                  ),
                ],
              ),
              CustomText.text(
                  text: 'Gomti Nagar, Lucknow',
                  fontSize: 12.sp,
                  color: CustomColors.mediumGrey),
              SizedBox(
                height: 5.h,
              ),
              Row(
                children: [
                  Icon(
                    Icons.assistant_photo_outlined,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  CustomText.text(
                      text: 'Gomti Nagar, Lucknow',
                      fontSize: 12.sp,
                      color: CustomColors.supportiveColor),
                ],
              ),
              SizedBox(height: 10.h),
              AppointmentMeeting(
                remindMe: () {
                  CustomSnackBar.showCustomSnackBar(
                      context, 'We will remind you after 30 min..',
                      second: 3, backgroundColor: Colors.blue);
                },
                joinMeeting: () {
                  _openMeetUrl(context);
                },
                copyMeetUrl: () {
                  _copyMeetLink();
                },
                meetUrl: _meetUrl,
              ),
            ],
          )),
    );
  }
}
