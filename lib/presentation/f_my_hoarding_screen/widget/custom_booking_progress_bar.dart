import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../core/app_export.dart';

class CustomBookingProgressBar extends StatefulWidget {
  final double? width;
  final double? lineHeight;

  const CustomBookingProgressBar({super.key, this.width, this.lineHeight});

  @override
  State<CustomBookingProgressBar> createState() =>
      _CustomBookingProgressBarState();
}

class _CustomBookingProgressBarState extends State<CustomBookingProgressBar> {
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
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * 0.04,
      child: Stack(
        children: [
          LinearPercentIndicator(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            width: widget.width! - 100,
            // animation: true,
            barRadius: const Radius.circular(10),
            lineHeight: widget.lineHeight ?? 3.0,
            percent: percent,
            animationDuration: 300,
            center: Text(
              "${(percent * 100).toStringAsFixed(1)}%",
              style:
              const TextStyle(color: Colors.white), // Set text color here
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
            left: (widget.width! - 100) * percent +
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
    );
  }
}
