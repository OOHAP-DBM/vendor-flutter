import 'package:google_fonts/google_fonts.dart';

import '../../core/app_export.dart';

class DetailScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  const DetailScreenAppBar({
    super.key,
    this.leading,
    this.centerTitle,
    this.elevation,
    this.backgroundColor,
    this.title,
    this.actions,
    this.titleWidget,
    this.onTap,
  });

  final Widget? leading;
  final bool? centerTitle;
  final double? elevation;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final String? title;
  final Widget? titleWidget;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: CustomColors.whiteColor,
      backgroundColor: Colors.white,
      // disable material3 color in appbar
      //  leadingWidth: 40.w,
      // titleSpacing: 1.0,

      title: title != null
          ? Text(
              title!,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15.sp,
                  color: const Color(0xFF282C3E),
                  fontFamily: GoogleFonts.poppins().fontFamily),
            )
          : null,
      /*   title: title != null
          ? CustomText.bodyText(
              text: title,
              fontWeight: FontWeight.w500,
            )
          : null,*/
      /*   title: titleWidget ??
          CustomText.headline(text: title, color: CustomColors.primaryBlack),*/
      centerTitle: centerTitle ?? true,
      elevation: elevation ?? 0,
      //backgroundColor: Colors.green[50],
      shadowColor: Colors.white,
      actions: actions,
      // backgroundColor: backgroundColor ?? CustomColors.whiteColor,
      /* leading: Padding(
        padding: const EdgeInsets.only(left: 14.0),
        child: leading,
      ),*/

      // padding: EdgeInsets.only(
      //     top: MediaQuery.of(context).padding.top * 0.20,
      //     bottom: 10.h),
      leading: leading ??
          Padding(
            padding: EdgeInsets.all(8.r),
            child: CircularButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icons.arrow_back,
              iconColor: const Color(0xFF282C3E),
            ),
          ),
    );
  }
}
