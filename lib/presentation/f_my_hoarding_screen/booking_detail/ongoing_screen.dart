/*
SizedBox(
height: 10.h,
),

// Timeline will here

Padding(
padding: EdgeInsets.symmetric(horizontal: 8.0.w),
child: Container(
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
? Icon(Icons.keyboard_arrow_up_sharp)
    : Icon(Icons.keyboard_arrow_down_sharp),
)
],
),
_isCardCollapse ? Column(
children: [
SizedBox(
height: 10.h,
),
LinearBookingProgress(progressBarWidth: size.width),
SizedBox(
height: 7.h,
),
Container(
color: Colors.grey[400],
height: 2.0.h,
),
SizedBox(
height: 7.h,
),
BookingProgressTimelineOne(
isFirst: true,
isLast: false,
progressTitle: 'Booking success',
),
BookingProgressTimelineTwo(
progressTitle: 'dhkasfada',
),
BookingProgressTimelineOne(
isFirst: false,
isLast: false,
progressTitle: 'Booking success',
),
BookingProgressTimelineTwo(
progressTitle: 'dhkasfada',
),
BookingProgressTimelineOne(
isFirst: false,
isLast: true,
progressTitle: 'Booking success',
),
],
) : SizedBox.shrink(),
],
),
),
),*/
