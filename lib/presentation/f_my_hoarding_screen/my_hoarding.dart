import 'package:flutter/cupertino.dart';
import 'package:oohapp/presentation/f_my_hoarding_screen/booking_detail/cancelled_screen.dart';
import 'package:oohapp/presentation/f_my_hoarding_screen/booking_detail/completed_screen.dart';
import 'package:oohapp/presentation/f_my_hoarding_screen/booking_detail/new_card_screen.dart';
import 'package:oohapp/presentation/f_my_hoarding_screen/widget/order_card.dart';
import 'package:oohapp/presentation/f_my_hoarding_screen/widget/search_text_field.dart';
import 'package:oohapp/widgets/custom_appbar/detail_screen_app_bar.dart';
import 'package:oohapp/widgets/custom_bottom_sheet.dart';
import 'package:oohapp/widgets/custom_buttons/custom_text_btn.dart';
import 'package:oohapp/widgets/custom_new_text_field.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_action_chip.dart';

class MyBookings extends StatefulWidget {
  const MyBookings({super.key});

  @override
  State<MyBookings> createState() => _MyBookingsState();
}

class _MyBookingsState extends State<MyBookings> {
  List<String> bookingStatusList = ['NEW', 'ONGOING', 'COMPLETED', 'CANCELLED'];

  int _bookingStatusIndex = 0;

  /// Function for show divider width to the size of equal to the text width

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
    } else if (value == 'Accept All') {
      return CustomColors.primaryGreen;
    } else if (value == 'Reject All') {
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

  /// radio tile of select date inside bottom sheet

  List<String> dateText = [
    'Last Day',
    'Last 7 Days',
    'Last Month',
    'Till Date',
    'Custom date range'
  ];

  /// Function for get date of start to end
  late TextEditingController _startDateController;
  late TextEditingController _endDateController;

  @override
  void initState() {
    super.initState();
    _startDateController = TextEditingController();
    _endDateController = TextEditingController();

    // Initialize text fields with dates
    setStartDate();
    setEndDate();
  }

  @override
  void dispose() {
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

  // Function to set start date as today
  void setStartDate() {
    DateTime today = DateTime.now();
    _startDateController.text = "${today.year}-${today.month}-${today.day}";
  }

  // Function to set end date from tomorrow to the last date of 2024
  void setEndDate() {
    DateTime tomorrow = DateTime.now().add(const Duration(days: 1));
    DateTime endOfYear2024 = DateTime(2024, 12, 31);
    _endDateController.text =
        "${tomorrow.year}-${tomorrow.month}-${tomorrow.day} to ${endOfYear2024.year}-${endOfYear2024.month}-${endOfYear2024.day}";
  }

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2024, 12, 31),
    );
    if (picked != null) {
      setState(() {
        controller.text = "${picked.year}-${picked.month}-${picked.day}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      //  backgroundColor: Colors.grey[200],
      resizeToAvoidBottomInset: true,
      appBar: DetailScreenAppBar(
        title: 'My Bookings',
        actions: [
          if (_bookingStatusIndex == 0)
            PopupMenuButton<String>(
              surfaceTintColor: Colors.white,
              elevation: 5,
              onSelected: (value) {
                setState(() {
                  _currentStatusValue = value;
                });
              },
              iconColor: const Color(0xFF282C3E),
              icon: const Icon(Icons.more_vert_sharp),
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'Accept All',
                  child: CustomText.text(
                    text: 'Accept All',
                    color: CustomColors.primaryGreen,
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'Reject All',
                  child: CustomText.text(
                    text: 'Reject All',
                    color: Colors.red,
                  ),
                ),
              ],
            )
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: size.width * 0.75,
                  child: SearchTextField(
                    hintText: 'Search for Bookings',
                    borderRadius: 30.r,
                    padding: EdgeInsets.zero,
                  ),
                ),
                Container(
                  width: size.width * 0.13,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: IconButton(
                    color: const Color(0xFF282C3E),
                    onPressed: () {
                      List<String> dateText = [
                        'Last Day',
                        'Last 7 Days',
                        'Last Month',
                        'Till Date',
                        'Custom date range'
                      ];

                      int selectedDateValue = -1;
                      bool showDateTextField = false;

                      CustomBottomSheet.showSheet(
                        height: size.height * 0.45,
                        context,
                        StatefulBuilder(
                          builder: (BuildContext context,
                                  void Function(void Function())
                                      updateWidget) =>
                              Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText.text(
                                text: 'Sort By',
                                fontWeight: FontWeight.w500,
                                fontSize: 15.sp,
                                overflow: TextOverflow.ellipsis,
                              ),
                              ...List.generate(
                                dateText.length,
                                (index) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ActionChip(
                                        avatar: Icon(
                                          selectedDateValue == index
                                              ? Icons.radio_button_checked
                                              : Icons.radio_button_off,
                                          color: selectedDateValue == index
                                              ? CustomColors.buttonGreen
                                              : CustomColors.grey,
                                          size: 22.w,
                                        ),
                                        label: CustomText.text(
                                            text: dateText[index],
                                            color: CustomColors.buttonColor),
                                        onPressed: () => updateWidget(() {
                                          selectedDateValue = index;
                                          if (index == dateText.length - 1) {
                                            showDateTextField = true;
                                          } else {
                                            showDateTextField = false;
                                          }
                                        }),
                                        backgroundColor: Colors.transparent,
                                        side: const BorderSide(
                                            color: Colors.transparent),
                                        padding: EdgeInsets.only(right: 10.w),
                                      ),
                                      if (index != dateText.length - 1)
                                        Column(
                                          children: [
                                            SizedBox(
                                              height: 7.h,
                                            ),
                                            Container(
                                              color: Colors.grey[200],
                                              height: 1.5.h,
                                            ),
                                          ],
                                        ),
                                    ],
                                  );
                                },
                              ),
                              showDateTextField
                                  ? Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomNewTextFormField(
                                              onTap: () => _selectDate(context,
                                                  _startDateController),
                                              controller: _startDateController,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 12.h),
                                              width: size.width * 0.43,
                                              hintText: 'DD-MM-YYYY',
                                              suffixIcon: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 8.0.w),
                                                child: const Icon(
                                                    Icons.calendar_month),
                                              ),
                                              readOnly: true,
                                            ),
                                            CustomNewTextFormField(
                                              onTap: () => _selectDate(
                                                  context, _endDateController),
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 12.h),
                                              width: size.width * 0.43,
                                              hintText: 'DD-MM-YYYY',
                                              suffixIcon: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 8.0.w),
                                                child: const Icon(
                                                    Icons.calendar_month),
                                              ),
                                              readOnly: true,
                                              controller: _endDateController,
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 15.h),
                                      ],
                                    )
                                  : const SizedBox.shrink(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  showDateTextField != false
                                      ? CustomButton(
                                          onTap: () {
                                            setState(() {
                                              showDateTextField = true;
                                            });
                                          },
                                          text: 'Clear',
                                          textColor: CustomColors.buttonColor,
                                          width: size.width * 0.43,
                                          backgroundColor:
                                              CustomColors.transparent,
                                          borderColor: CustomColors.mediumBlack,
                                        )
                                      : const SizedBox.shrink(),
                                  CustomButton(
                                    onTap: () => Navigator.pop(context),
                                    text: 'Apply',
                                    width: size.width * 0.43,
                                    backgroundColor: CustomColors.buttonColor,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.filter_alt_outlined),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                bookingStatusList.length,
                (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      _bookingStatusIndex = index;
                    });
                  },
                  child: Column(
                    children: [
                      CustomTextBtn(
                        text: bookingStatusList[index],
                        textColor: const Color(0xFF282C3E),
                        fontWeight: _bookingStatusIndex == index
                            ? FontWeight.w600
                            : FontWeight.normal,
                        fontSize: 14.sp,
                      ),
                      SizedBox(height: 5.h),
                      if (_bookingStatusIndex == index)
                        Container(
                          color: const Color(0xFF282C3E),
                          width: getTextWidth(
                              bookingStatusList[index], 14.0.sp.toDouble()),
                          height: 1.5,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            alignment: Alignment.center,
            width: size.width,
            padding: EdgeInsets.all(10.0.r),
            decoration: const BoxDecoration(
              color: CustomColors.buttonColor,
            ),
            child: CustomText.text(
              text: '3 Bookings',
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                if (_bookingStatusIndex == 0)
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.0.h),
                            child: GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => const NewBooking(),
                                  )),
                              child: OrderCard(
                                currentStatusBgColor: _getBackgroundColor(
                                    _getTextColor(_currentStatusValue)),
                                edgeInsets: EdgeInsets.only(left: 10.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText.text(
                                        text: _currentStatusValue,
                                        color:
                                            _getTextColor(_currentStatusValue),
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
                                          ),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Accept',
                                          child: CustomText.text(
                                            text: 'Accept',
                                            color: CustomColors.primaryGreen,
                                          ),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'Cancelled',
                                          child: CustomText.text(
                                            text: 'Cancelled',
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )),
                if (_bookingStatusIndex == 1)
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0.h),
                      child: OrderCard(
                        currentStatusBgColor: Colors.blue.withOpacity(0.1),
                        edgeInsets: EdgeInsets.all(11.5.r),
                        child: CustomText.text(
                            text: 'Accepted',
                            color: Colors.blue,
                            fontSize: 14.sp),
                      ),
                    ),
                  ),
                if (_bookingStatusIndex == 2)
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0.h),
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const CompletedScreen(),
                            )),
                        child: OrderCard(
                          currentStatusBgColor:
                              CustomColors.buttonGreen.withOpacity(0.1),
                          edgeInsets: EdgeInsets.all(11.5.r),
                          child: CustomText.text(
                              text: 'Completed',
                              color: CustomColors.buttonGreen,
                              fontSize: 14.sp),
                        ),
                      ),
                    ),
                  ),
                if (_bookingStatusIndex == 3)
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0.h),
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const CancelledScreen(),
                            )),
                        child: OrderCard(
                          currentStatusBgColor: Colors.red.withOpacity(0.1),
                          edgeInsets: EdgeInsets.all(11.5.r),
                          child: CustomText.text(
                              text: 'Cancelled',
                              color: Colors.red,
                              fontSize: 14.sp),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
