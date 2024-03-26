import '../core/app_export.dart';

class CustomSnackBar {
  static showCustomSnackBar(BuildContext context, String content,
      {IconData iconData = Icons.info,
        Color backgroundColor = CustomColors.buttonGreen,
        int second = 2}) {
    double screenWidth = MediaQuery.of(context).size.width;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(iconData, color: Colors.white),
            const SizedBox(width: 12.0),
            Flexible(
              child: CustomText.text(
                text: content,
                fontSize: 14.sp,
                // overflow: TextOverflow.ellipsis,
                //  maxLines: 2,
              ),
            ),
          ],
        ),
        duration: Duration(seconds: second),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        behavior: SnackBarBehavior.floating,
        /* margin: EdgeInsets.only(bottom:  MediaQuery.of(context).size.height - MediaQuery.of(context).size.height * 0.20, left: 14.r, right: 14.r),*/

        margin: EdgeInsets.all(16.r),
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth < 600 ? 12.0 : 20.0,
          vertical: screenWidth < 600 ? 8.0 : 12.0,
        ),
        action: SnackBarAction(
            textColor: Colors.white,
            label: 'Undo',
            onPressed: () {
              // Handle undo action
            }),
      ),
    );
  }
}
