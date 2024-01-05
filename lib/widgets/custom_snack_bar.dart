import '../core/app_export.dart';

class CustomSnackBar {
  final Color? color;
  final String text;
  final int? second;
  final IconData? icon;
  final Color? iconColor;

  CustomSnackBar({
    this.color,
    required this.text,
    this.second,
    this.icon,
    this.iconColor,
  });

  void showSnackBar(context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: Row(
            children: [
              Icon(
                icon,
                color: iconColor ?? Colors.white,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(text),
            ],
          ),
        ),
        backgroundColor: color,
        duration: Duration(seconds: second ?? 1),
      ),
    );
  }
}
