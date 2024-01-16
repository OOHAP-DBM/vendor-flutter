import 'package:oohapp/core/app_export.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.leading,
    this.centerTitle,
    this.elevation,
    this.backgroundColor,
    this.title,
    this.actions,
  });

  final Widget? leading;
  final bool? centerTitle;
  final double? elevation;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: CustomColors.transparent, 
      leadingWidth: 85,
      title: title != null
          ? CustomText.secondaryTitle(text: title, color: Colors.black)
          : null,
      centerTitle: centerTitle,
      elevation: elevation ?? 1,
      actions: actions,
       // backgroundColor: backgroundColor ?? CustomColors.whiteColor,
      leading: Padding(
        padding: const EdgeInsets.only(left: 14.0),
        child: leading,
      ),
    );
  }

  // padding: const EdgeInsets.symmetric(horizontal: 14.0),
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
