import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:oohapp/core/app_export.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'package:table_calendar/table_calendar.dart';

class AddHoardingCalendarPage extends StatefulWidget {
  const AddHoardingCalendarPage({super.key});

  @override
  State<AddHoardingCalendarPage> createState() =>
      _AddHoardingCalendarPageState();
}

class _AddHoardingCalendarPageState extends State<AddHoardingCalendarPage> {
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is List<DateTime>) {
      List<DateTime> newSelection = args.value as List<DateTime>;

      // Filter out the dates that are not part of the highlightedDates.
      List<DateTime> validSelection = newSelection
          .where((date) => highlightedDates.contains(date))
          .toList();

      // Now, update the state to reflect the new selection
      setState(() {
        selectedDates.clear();
        for (DateTime date in validSelection) {
          selectedDates[date] =
              []; // Assuming you want to map dates to an empty list
        }
      });
    }
  }

  DateRangePickerController _datePickerController = DateRangePickerController();
  Map<DateTime, List> selectedDates = {};
  DateTime _focusedDay = DateTime.now();
  int _selectedYear = DateTime.now().year;
  int _selectedMonth = DateTime.now().month;

  List<DateTime> highlightedDates = [
    DateTime(2024, 1, 20),
    DateTime(2024, 1, 22),
    DateTime(2024, 1, 19),
    DateTime(2024, 1, 18),
    DateTime(2024, 1, 17),
    DateTime(2024, 1, 16),
    DateTime(2024, 1, 15),
    DateTime(2024, 1, 14),
    DateTime(2024, 1, 13),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Business Details',
        centerTitle: true,
        elevation: 1,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: CircularButton(
            onPressed: () {
              Navigator.pop(context);
            },
            backgroundColor: CustomColors.grey,
            borderColor: CustomColors.transparent,
            icon: Icons.arrow_back,
            iconColor: CustomColors.blackColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFormField(
              placeholder: 'Manage Availibility*',
              hintText: 'Available/Block dates',
              suffixIcon: IconButton(
                icon: const Icon(Icons.calendar_today_outlined),
                onPressed: () {
                  _showCalendarBottomSheet(context);
                },
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Blocked dates',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            _buildChipsRow(),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(
                      onTap: () {},
                      text: 'Save & Generate QR',
                      backgroundColor:
                          selectedDates.isNotEmpty ? Colors.green : Colors.grey,
                    ),
                    const SizedBox(height: 12),
                    CustomButton(onTap: () {}, text: 'Cancel'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCalendarBottomSheet(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.80,
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setModalState) {
              return Padding(
                padding: const EdgeInsets.only(top: 8, right: 16.0, left: 16),
                child: Column(children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 150,
                        height: 50,
                        padding: const EdgeInsets.all(10),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 0.50, color: Color(0xFF949291)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<int>(
                            value: _selectedMonth,
                            items: List<DropdownMenuItem<int>>.generate(12,
                                (int index) {
                              return DropdownMenuItem<int>(
                                value: index + 1,
                                child: Text(
                                  DateFormat('MMMM')
                                      .format(DateTime(0, index + 1)),
                                ),
                              );
                            }),
                            onChanged: (int? newValue) {
                              if (newValue != null) {
                                setModalState(() {
                                  _selectedMonth = newValue;
                                  _focusedDay =
                                      DateTime(_selectedYear, _selectedMonth);
                                  _datePickerController.displayDate =
                                      _focusedDay; // Update calendar view
                                });
                              }
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 100,
                        height: 50,
                        padding: const EdgeInsets.all(10),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 0.50, color: Color(0xFF949291)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<int>(
                            value: _selectedYear,
                            items: List<DropdownMenuItem<int>>.generate(30,
                                (int index) {
                              int year = DateTime.now().year - 15 + index;
                              return DropdownMenuItem<int>(
                                value: year,
                                child: Text(year.toString()),
                              );
                            }),
                            onChanged: (int? newValue) {
                              if (newValue != null) {
                                setModalState(() {
                                  _selectedYear = newValue;
                                  _focusedDay =
                                      DateTime(_selectedYear, _selectedMonth);
                                  _datePickerController.displayDate =
                                      _focusedDay;
                                });
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 2.1,
                    child: SfDateRangePicker(
                      controller: _datePickerController,
                      view: DateRangePickerView.month,
                      selectionMode: DateRangePickerSelectionMode.multiple,
                      monthViewSettings: DateRangePickerMonthViewSettings(
                        specialDates: highlightedDates,
                        blackoutDates: selectedDates.keys.toList(),
                      ),
                      monthCellStyle: const DateRangePickerMonthCellStyle(
                          todayTextStyle: TextStyle(color: Colors.white),
                          blackoutDateTextStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          blackoutDatesDecoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          specialDatesTextStyle: TextStyle(
                            color: Colors.green,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          )),
                      onSelectionChanged: _onSelectionChanged,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Container(
                    width: double.infinity,
                    height: 95,
                    padding: const EdgeInsets.all(4),
                    decoration: ShapeDecoration(
                      color: CustomColors.tertiaryGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.info,
                              color: Colors.green,
                              size: 15,
                            ),
                            SizedBox(width: 7),
                            Text(
                              'IMPORTANT',
                              style: TextStyle(
                                color: Color(0xFF282C3E),
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 1,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Text(
                          'All available dates are open for booking. If you wish to prevent booking on specific dates, you should select those dates and mark them as blocked.',
                          style: TextStyle(
                            color: Color(0xFF636363),
                            fontSize: 12,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 22),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButton(
                        onTap: () {},
                        text: 'Block',
                        width: size.width * 0.45,
                        backgroundColor: const Color(0xFF282C3E),
                      ),
                      CustomButton(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        text: 'Cancel',
                        width: size.width * 0.45,
                        backgroundColor: const Color(0xFFDDDDDD),
                      ),
                    ],
                  ),
                ]),
              );
            },
          ),
        );
      },
    ).then((_) {
      setState(() {});
    });
  }

  Widget _buildChipsRow() {
    double screenWidth = MediaQuery.of(context).size.width;
    double chipPadding = 8; // Padding on the sides
    double spaceBetweenChips = 4; // Reduced horizontal space between chips
    double spaceBetweenRows = 4; // Reduced vertical space between rows of chips
    double chipWidth =
        (screenWidth - (2 * chipPadding) - spaceBetweenChips) / 2;

    return Wrap(
      spacing: spaceBetweenChips, // Reduced horizontal space between chips
      runSpacing: spaceBetweenRows, // Reduced vertical space between rows
      children: _buildDateChips(chipWidth),
    );
  }

  List<Widget> _buildDateChips(double width) {
    List<Widget> chips = [];
    for (DateTime date in selectedDates.keys) {
      chips.add(
        Container(
          margin: EdgeInsets.only(
              bottom: 12), // Add margin for spacing between chip rows if needed
          child: SizedBox(
            height: 70,
            width: MediaQuery.of(context).size.width * 0.40,
            child: Chip(
              backgroundColor: Color(0xFFEBEAEA),
              labelPadding: EdgeInsets.symmetric(horizontal: 12),
              label: Text(
                DateFormat('MMM dd, yyyy').format(date),
                style: TextStyle(
                  color: Color(0xFF1E1B18),
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
              deleteIconColor: Colors.black,
              onDeleted: () {
                setState(() {
                  selectedDates.remove(date);
                });
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Colors.transparent),
              ),
            ),
          ),
        ),
      );
    }
    return chips;
  }
}
