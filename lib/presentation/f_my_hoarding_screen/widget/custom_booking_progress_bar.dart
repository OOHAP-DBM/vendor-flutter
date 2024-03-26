/*
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../core/app_export.dart';

class LinearBookingProgress extends StatefulWidget {
  final double progressBarWidth;
  final double? lineHeight;
  final String? startDate;
  final String? startYear;
  final String? endDate;
  final String? endYear;

  const LinearBookingProgress(
      {super.key,
      required this.progressBarWidth,
      this.lineHeight,
      this.startDate,
      this.startYear,
      this.endDate,
      this.endYear});

  @override
  State<LinearBookingProgress> createState() => _LinearBookingProgressState();
}

class _LinearBookingProgressState extends State<LinearBookingProgress> {
  double percent = 0.0;

  void incrementPercent() {
    setState(() {
      percent += 0.1;
      if (percent > 1.0) {
        percent = 1.0;
      }
    });
  }

  void decrementPercent() {
    print('hdhas');
    setState(() {
      percent -= 0.1;
      if (percent < 0.0) {
        percent = 0.0;
      }
    });
  }

  Timer? timer;
  bool stopProcess = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    if (percent < 1.0 && !stopProcess) {
      timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
        setState(() {
          percent += 0.1;
          if (percent >= 1.0) {
            percent = 1.0;
            stopProcess = true; // Stop the process when 100% is reached
            timer?.cancel();
          }
        });
      });
    }
  }

  @override
  void dispose() {
    // Cancel the timer to avoid memory leaks
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ///
    double screenWidth = MediaQuery.of(context).size.width;
      double linearWidth = (screenWidth - widget.progressBarWidth) * 0.5;

    return Container(
      color: Colors.red[200],
      width: widget.progressBarWidth,
      child: Row(
        //  mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              CustomText.text(
                  text: widget.startDate ?? '01 May',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600),
              SizedBox(
                height: 2.h,
              ),
              Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 1.sp, horizontal: 5.sp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: Colors.black,
                  ),
                  child: CustomText.text(
                      text: widget.startYear ?? '2024',
                      fontSize: 8.sp,
                      color: Colors.white)),
            ],
          ),
          SizedBox(
            width: 5.0.w,
          ),

          Container(

            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * 0.04,
            child: Stack(
              children: [
                LinearPercentIndicator(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  width: linearWidth - 100,
                  // animation: true,
                  barRadius: const Radius.circular(10),
                  lineHeight: widget.lineHeight ?? 3.0,
                  percent: percent,
                  animationDuration: 300,
                  center: Text(
                    "${(percent * 100).toStringAsFixed(1)}%",
                    style: const TextStyle(
                        color: Colors.white), // Set text color here
                  ),
                  restartAnimation: true,
                  progressColor: CustomColors.buttonGreen,
                  trailing: Container(
                    padding: const EdgeInsets.all(4),
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: CustomColors.buttonGreen,
                        width: 2.4,
                      ),
                      color: Colors.white,
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: CustomColors.buttonGreen,
                      ),
                    ),
                  ),
                  leading: Container(
                    padding: const EdgeInsets.all(4),
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: CustomColors.buttonGreen,
                        width: 2.4,
                      ),
                      color: Colors.white,
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: CustomColors.buttonGreen,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  height: 12,
                  top: 0,
                  left: (linearWidth - 100) * percent +
                      ((percent == 1.0 && percent != 0) ? 15 : 0),
                  child: GestureDetector(
                    onPanUpdate: (details) {
                      if (details.delta.dx > 0) {
                        incrementPercent();
                      } else {
                        decrementPercent();
                      }
                    },
                    child: SizedBox(
                      width: 15,
                      height: 15,
                      child: Image.asset(
                        ImageConstant.oIcon,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 5.0.w,
          ),

          /// User Booking progress widget here

          Column(
            children: [
              CustomText.text(
                  text: widget.endDate ?? '01 Jun',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600),
              SizedBox(
                height: 2.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 1.sp, horizontal: 5.sp),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: Colors.black,
                ),
                child: CustomText.text(
                    text: widget.endYear ?? '2024',
                    fontSize: 8.sp,
                    color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
*/

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:oohapp/core/app_export.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class LinearBookingProgress extends StatefulWidget {
  final double progressBarWidth;
  final double? lineHeight;
  final String? startDate;
  final String? startYear;
  final String? endDate;
  final String? endYear;

  const LinearBookingProgress({
    super.key,
    required this.progressBarWidth,
    this.lineHeight,
    this.startDate,
    this.startYear,
    this.endDate,
    this.endYear,
  });

  @override
  State<LinearBookingProgress> createState() => _LinearBookingProgressState();
}

class _LinearBookingProgressState extends State<LinearBookingProgress> {
  double percent = 0.0;

  void incrementPercent() {
    setState(() {
      percent += 0.1;
      if (percent > 1.0) {
        percent = 1.0;
      }
    });
  }

  void decrementPercent() {
    setState(() {
      percent -= 0.1;
      if (percent < 0.0) {
        percent = 0.0;
      }
    });
  }

  Timer? timer;
  bool stopProcess = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    if (percent < 1.0 && !stopProcess) {
      timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
        setState(() {
          percent += 0.1;
          if (percent >= 1.0) {
            percent = 1.0;
            stopProcess = true; // Stop the process when 100% is reached
            timer?.cancel();
          }
        });
      });
    }
  }

  @override
  void dispose() {
    // Cancel the timer to avoid memory leaks
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double linearWidth = (widget.progressBarWidth * 0.8) - 100;

    return SizedBox(
      width: widget.progressBarWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              CustomText.text(
                  text: widget.startDate ?? '01 May', fontSize: 16.sp),
              SizedBox(height: 8.h),
              Container(
                padding: EdgeInsets.all(5.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: Colors.black,
                ),
                child: CustomText.text(
                    text: widget.startYear ?? '2024',
                    fontSize: 10.sp,
                    color: Colors.white),
              ),
            ],
          ),
          Container(
            alignment: Alignment.center,
            height: 40.h,
            child: Stack(
              children: [
                LinearPercentIndicator(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  width: linearWidth,
                  lineHeight: widget.lineHeight ?? 3.0,
                  percent: percent,
                  animationDuration: 300,
                  center: CustomText.text(
                      text: "${(percent * 100).toStringAsFixed(1)}%",
                      color: Colors.white),
                  progressColor: Colors.green,
                  trailing: Container(
                    padding: EdgeInsets.all(4.r),
                    width: 15.w,
                    height: 15.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.green,
                        width: 2.4,
                      ),
                      color: Colors.white,
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  leading: Container(
                    padding: EdgeInsets.all(4.r),
                    width: 15.w,
                    height: 15.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.green,
                        width: 2.4,
                      ),
                      color: Colors.white,
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  height: 12,
                  top: 0,
                  left: (linearWidth * percent) +
                      ((percent == 1.0 && percent != 0) ? 15 : 0),
                  child: GestureDetector(
                    onPanUpdate: (details) {
                      if (details.delta.dx > 0) {
                        incrementPercent();
                      } else {
                        decrementPercent();
                      }
                    },
                    child: SizedBox(
                      width: 15,
                      height: 15,
                      child: Image.asset(
                        ImageConstant.oIcon,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              CustomText.text(
                  text: widget.endDate ?? '01 Jun', fontSize: 16.sp),
              SizedBox(height: 8.h),
              Container(
                padding: EdgeInsets.all(5.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.black,
                ),
                child: CustomText.text(
                    text: widget.endYear ?? '2024',
                    fontSize: 10.sp,
                    color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
