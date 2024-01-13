import 'package:flutter/material.dart';

import 'package:oohapp/core/app_export.dart';

class AddHoardingCalendarPage extends StatefulWidget {
  const AddHoardingCalendarPage({super.key});

  @override
  _AddHoardingCalendarPageState createState() =>
      _AddHoardingCalendarPageState();
}

class _AddHoardingCalendarPageState extends State<AddHoardingCalendarPage> {
  Map<DateTime, List> selectedDates = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Business Details',
        centerTitle: true,
        elevation: 1,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: CircularButton(
            onTap: () {
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
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(
                      onTap: () {},
                      text: 'Block',
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
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Column(children: [
              // Container(
              //   height: MediaQuery.of(context).size.height / 1.5,
              //   child: TableCalendar(
              //     onDaySelected: (DateTime day, List events, List holidays) {
              //       setModalState(() {
              //         if (selectedDates.containsKey(day)) {
              //           selectedDates.remove(day);
              //         } else {
              //           selectedDates[day] = [];
              //         }
              //       });
              //       setState(() {});
              //     },
              //     calendarStyle: CalendarStyle(
              //       todayColor: Colors.orange,
              //       selectedColor: Theme.of(context).primaryColor,
              //       markersColor: Colors.brown,
              //     ),
              //     headerStyle: HeaderStyle(
              //       formatButtonShowsNext: false,
              //     ),
              //     builders: CalendarBuilders(
              //       selectedDayBuilder: (context, date, events) {
              //         return Container(
              //           margin: const EdgeInsets.all(4.0),
              //           alignment: Alignment.center,
              //           decoration: BoxDecoration(
              //             color: Theme.of(context).primaryColor,
              //             shape: BoxShape.circle,
              //           ),
              //           child: Text(
              //             date.day.toString(),
              //             style: const TextStyle(color: Colors.white),
              //           ),
              //         );
              //       },
              //       todayDayBuilder: (context, date, events) {
              //         return Container(
              //           margin: const EdgeInsets.all(4.0),
              //           alignment: Alignment.center,
              //           decoration: const BoxDecoration(
              //             color: Colors.orange,
              //             shape: BoxShape.circle,
              //           ),
              //           child: Text(
              //             date.day.toString(),
              //             style: const TextStyle(color: Colors.white),
              //           ),
              //         );
              //       },
              //     ),
              //     calendarController: CalendarController(),
              //   ),
              // ),
              
              const SizedBox(
                height: 18,
              ),
              Container(
                width: 343,
                height: 78,
                padding: const EdgeInsets.all(4),
                decoration: ShapeDecoration(
                  color: CustomColors.tertiaryGreen,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
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
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          'IMPORTANT',
                          style: TextStyle(
                            color: Color(0xFF282C3E),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'All available dates are open for booking. If you wish to prevent booking on specific dates, you should select those dates and mark them as blocked.',
                      style: TextStyle(
                        color: Color(0xFF636363),
                        fontSize: 12,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 22,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(onTap: () {  }, text: 'Block',
                  width: 165,
                     backgroundColor:Color(0xFF282C3E)
                    //   formValidationCubit.isFormValid()
                    // ? Color(0xFFDDDDDD)
                    // : Color(0xFF282C3E),


                  ),
                       CustomButton(onTap: () {  }, text: 'Cancel',
                  width: 165,
                     backgroundColor:Color(0xFFDDDDDD)
                    //   formValidationCubit.isFormValid()
                    // ? Color(0xFFDDDDDD)
                    // : Color(0xFF282C3E),


                  ),
                  
                ],
              )
            ]
            );
          },
        );
      },
    );
  }
}
