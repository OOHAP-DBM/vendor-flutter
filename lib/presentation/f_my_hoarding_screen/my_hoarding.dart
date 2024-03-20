import 'package:flutter/cupertino.dart';
import 'package:oohapp/presentation/f_my_hoarding_screen/widget/order_card.dart';
import 'package:oohapp/presentation/f_my_hoarding_screen/widget/search_text_field.dart';
import 'package:oohapp/widgets/custom_appbar/detail_screen_app_bar.dart';
import 'package:oohapp/widgets/custom_bottom_sheet.dart';
import 'package:oohapp/widgets/custom_buttons/custom_text_btn.dart';
import '../../core/app_export.dart';

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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      //  backgroundColor: Colors.grey[200],
      appBar: DetailScreenAppBar(
        title: 'My Bookings',
        actions: [
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

                      int _selectedDateValue = -1;
/*
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText.text(
                                text: 'Sort By',
                                fontWeight: FontWeight.w500,
                                fontSize: 15.sp,
                                overflow: TextOverflow.ellipsis,
                              ),
                              ...List.generate(dateText.length, (index) {
                                return Padding(
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 2.0),
                                  child: Row(
                                    children: [
                                      StatefulBuilder(builder: (context, setState) {
                                        return Radio(
                                          value: index,
                                          groupValue: _selectedDateValue,
                                          onChanged: (value) {
                                            setState(() {
                                              _selectedDateValue = value as int;
                                            });
                                          },
                                           activeColor: CustomColors.buttonGreen,
                                          fillColor: MaterialStateProperty
                                              .resolveWith<Color>(
                                            (Set<MaterialState> states) {
                                              return _selectedDateValue == index
                                                  ? CustomColors.buttonGreen
                                                  : Colors.grey;
                                            },
                                          ),
                                        );
                                      }),
                                      const SizedBox(width: 8.0),
                                      CustomText.text(text: dateText[index]),
                                    ],
                                  ),
                                );
                              })
                            ],
                          ),
                        )
                      );*/

                      CustomBottomSheet.showSheet(
                        height: size.height * 0.45,
                        context,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText.text(
                              text: 'Sort By',
                              fontWeight: FontWeight.w500,
                              fontSize: 15.sp,
                              overflow: TextOverflow.ellipsis,
                            ),
                            ...List.generate(dateText.length, (index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 2.0),
                                child: Row(
                                  children: [
                                    StatefulBuilder(
                                        builder: (context, setState) {
                                      return Radio(
                                        value: index,
                                        groupValue: _selectedDateValue,
                                        onChanged: (value) {
                                          setState(() {
                                            _selectedDateValue = value!;
                                            //  Navigator.of(context).pop();
                                          });
                                        },
                                        activeColor: CustomColors.buttonGreen,
                                        fillColor: MaterialStateProperty
                                            .resolveWith<Color>(
                                          (Set<MaterialState> states) {
                                            return _selectedDateValue == index
                                                ? CustomColors.buttonGreen
                                                : Colors.grey;
                                          },
                                        ),
                                      );
                                    }),
                                    const SizedBox(width: 8.0),
                                    CustomText.text(text: dateText[index]),
                                  ],
                                ),
                              );
                            }),
                            Row(
                              children: [
                                CustomButton(
                                  onTap: () {},
                                  text: 'Apply',
                                  width: size.width * 0.45,
                                  backgroundColor: CustomColors.buttonColor,
                                ),
                                CustomButton(
                                  onTap: () {},
                                  text: 'Apply',
                                  width: size.width * 0.45,
                                  backgroundColor: CustomColors.buttonColor,
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            ),
                          ],
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
                                      color: _getTextColor(_currentStatusValue),
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
                                        value: 'Accept All',
                                        child: CustomText.text(
                                          text: 'Accept All',
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
                if (_bookingStatusIndex == 3)
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0.h),
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
              ],
            ),
          )
        ],
      )),
    );
  }
/*
  Widget _buildRadioButtonRow({
    required String text,
    required int isSelected,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
          Radio(
              value: isSelected,
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value!;
                });
              },
              activeColor: CustomColors.buttonGreen,
              fillColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                return _selectedOption == isSelected
                    ? CustomColors.buttonGreen
                    : CustomColors.mediumBlack;
              })),
          const SizedBox(width: 8.0),
          CustomText.text(text: text, fontSize: 15.sp),
        ],
      ),
    );
  }*/
}
