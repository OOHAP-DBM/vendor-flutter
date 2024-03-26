import 'package:timeline_tile/timeline_tile.dart';
import '../../../../core/app_export.dart';

class BookingProgressTimelineOne extends StatelessWidget {
  const BookingProgressTimelineOne({
    super.key,
    required this.isFirst,
    required this.isLast,
    this.time = '8:25 AM',
    this.date = 'Mar 23',
    this.progressLineColor = CustomColors.buttonGreen,
    this.progressTitle,
    this.iconColor = Colors.white,
    this.iconBackgroundColor = CustomColors.buttonGreen,
    this.lineColor = CustomColors.buttonGreen,
    this.child,
    this.iconData,
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
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      isFirst: isFirst,
      isLast: isLast,
      alignment: TimelineAlign.manual,
      beforeLineStyle: LineStyle(color: lineColor, thickness: 1.5),
      indicatorStyle: IndicatorStyle(

          iconStyle: IconStyle(

              iconData: iconData  ?? Icons.calendar_month, color: iconColor),
          color: iconBackgroundColor,
          height: 30.w,
          width: 30.w),
      endChild: Padding(
        padding: EdgeInsets.symmetric(vertical: 38.0.h, horizontal: 8.w),
        child: progressTitle != null
            ? CustomText.text(
                text: progressTitle!,
                fontSize: 14.sp,
                fontWeight: FontWeight.w300)
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
