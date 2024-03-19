

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/app_export.dart';

class ImageScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  final String title;
  final String dateTime;
  final void Function() starOnPressed;
  final void Function() shareOnPressed;
  final void Function() moreOnPressed;

  const ImageScreenAppBar(
      {super.key,
        required this.title,
        required this.dateTime,
        required this.starOnPressed,
        required this.shareOnPressed,
        required this.moreOnPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      leading: BackButton(
        color: Colors.white,
        onPressed: () => Navigator.of(context).pop(),
      ),
      //  surfaceTintColor: Colors.black,
      backgroundColor: Colors.black.withOpacity(0.3),
      elevation: 4,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText.text(
              text: title,
              fontSize: 14.5.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white),
          SizedBox(
            height: 3.h,
          ),
          CustomText.text(text: dateTime, fontSize: 11.sp, color: Colors.white)
        ],
      ),
      actions: [
        IconButton(
            onPressed: starOnPressed,
            icon: const Icon(
              Icons.star_border,
              color: Colors.white,
            )),
        IconButton(
            onPressed: shareOnPressed,
            icon: const Icon(
              Icons.share,
              color: Colors.white,
            )),
        IconButton(
            onPressed: moreOnPressed,
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
            )),
      ],
    );
  }
}
