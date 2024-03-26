import 'package:timeline_tile/timeline_tile.dart';
import '../../../../core/app_export.dart';

class BookingProgressTimelineTwo extends StatelessWidget {
  const BookingProgressTimelineTwo({
    super.key,
    this.isFirst = false,
    this.isLast = false,
    this.time = '8:25 AM',
    this.date = 'Mar 23',
    this.progressLineColor = CustomColors.buttonGreen,
    this.progressTitle,
    this.iconColor = Colors.white,
    this.iconBackgroundColor = CustomColors.buttonGreen,
    this.lineColor = CustomColors.buttonGreen,
    this.child,
  });

  final bool isFirst;
  final bool isLast;
  final String time;
  final String date;
  final Color progressLineColor;
  final String? progressTitle;
  final Color iconColor;
  final Color iconBackgroundColor;
  final Color lineColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return TimelineTile(
      isFirst: isFirst,
      isLast: isLast,
      alignment: TimelineAlign.manual,
      beforeLineStyle: LineStyle(
        color: lineColor,
        thickness: 1.5,
      ),

      indicatorStyle: IndicatorStyle(
        height: 10.h,
        width: 10.w,
        indicator: Container(
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.black),
        ),
      ),
      endChild: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: progressTitle != null
            ? CustomText.text(
                text: progressTitle!,
                fontSize: 12.sp,
                fontWeight: FontWeight.w300,
                color: CustomColors.mediumBlack.withOpacity(0.7))
            : SizedBox(
                child: child,
              ),
      ),
      hasIndicator: true,
      //  afterLineStyle: LineStyle(color: progressLineColor),
      startChild: CustomText.text(text: "$time \n $date"),
      lineXY: 0.20,
    );
  }
}
