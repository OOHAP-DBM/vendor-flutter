import '../../../core/app_export.dart';

class RowTextWidget extends StatelessWidget {
  const RowTextWidget({
    super.key,
    this.title,
    this.subTitle,
    this.fontWeight,
    this.titleColor,
    this.subTitleChild,
    this.titleChild,
  });

  final String? title;
  final String? subTitle;
  final FontWeight? fontWeight;
  final Color? titleColor;
  final Widget? subTitleChild;
  final Widget? titleChild;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        title != null
            ? CustomText.text(
                text: '$title',
                fontWeight: fontWeight ?? FontWeight.w600,
                color: titleColor,
                fontSize: 14.sp)
            : SizedBox(
                child: titleChild,
              ),
        subTitle != null
            ? CustomText.text(text: subTitle!, fontSize: 14.sp)
            : SizedBox(
                child: subTitleChild,
              ),
      ],
    );
  }
}
