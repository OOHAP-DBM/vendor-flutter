import 'package:oohapp/core/app_export.dart';

import 'package:oohapp/core/constants/global_cubit/character_count_cubit.dart';

class CustomImageUploaderContainer extends StatelessWidget {
  const CustomImageUploaderContainer({
    Key? key,
    this.onPressed,
    this.color,
    this.text,
    this.child,
    this.height,
    this.width,
    this.margin,
    this.alignment,
    this.icon,
    this.onChanged,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final Color? color;
  final String? text;
  final Widget? child;
  final double? height;
  final double? width;

  final EdgeInsets? margin;
  final Alignment? alignment;

  final Widget? icon;

  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height ?? ScaleSize.height(5.66),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color(0xFF282C3E)),
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: onPressed,
                icon: Icon(Icons.add),
              ),
              SizedBox(
                height: 8,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  text.toString(),
                  style: TextStyle(
                    color: Color(0xFFA6A0A0),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w300,
                    height: 0,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
