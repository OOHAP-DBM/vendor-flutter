import 'package:oohapp/core/app_export.dart';

class CustomSmallButton extends StatelessWidget {
  const CustomSmallButton({
    super.key,
    required this.onTap,
    required this.text,
    this.child,
    this.height,
    this.width,
    this.backgroundColor,
    this.textColor,
  });

  final VoidCallback onTap;

  final Color? backgroundColor;
  final Color? textColor;
  final String text;
  final Widget? child;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {


    return InkWell(
        onTap: onTap,
        child: Container(
          width:width?? 163.50,
          height: height??46,
          padding: const EdgeInsets.all(8),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0xFF282C3E)),
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText.subHeadingText(
                text: text,
              ),
              const SizedBox(width: 4),
              Container(
                width: 16,
                height: 16,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(),
                child: const Stack(children: [Icon(Icons.error)]),
              ),
            ],
          ),
        ));
  }
}
