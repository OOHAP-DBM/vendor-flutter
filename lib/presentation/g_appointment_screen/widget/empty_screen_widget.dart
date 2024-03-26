import '../../../core/app_export.dart';

class EmptyScreenWidget extends StatelessWidget {
  const EmptyScreenWidget({
    super.key,
    this.onTap,
    required this.imageUrl,
    required this.title,
    required this.subTitle,
    this.buttonText,
  });

  final void Function()? onTap;
  final String imageUrl;
  final String title;
  final String subTitle;
  final String? buttonText;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Column(
          children: [
            SizedBox(
              height: size.height * 0.15,
            ),
            SizedBox(
              width: 200.w,
              height: 150.h,
              child: Image.asset(imageUrl),
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomText.text(
                text: title, fontSize: 18.sp, fontWeight: FontWeight.w600),
            SizedBox(
              height: 10.h,
            ),
            CustomText.text(
                text: subTitle,
                fontSize: 16.sp,
                color: CustomColors.mediumBlack,
                textAlign: TextAlign.center,
                softWrap: true),
            SizedBox(
              height: 20.h,
            ),
            buttonText != null
                ? CustomButton(text: buttonText, onTap: onTap)
                : const SizedBox.shrink(),
          ],
        ),
      ],
    );
  }
}
