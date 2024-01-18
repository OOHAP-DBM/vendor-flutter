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
   
      leading: Padding(
        padding: const EdgeInsets.only(left: 14.0),
        child: leading != null
            ? SizedBox(
                width: 40, 
                height: 40, 
                child: Align(
                  alignment: Alignment.center,
                  child: leading,
                ),
              )
            : null,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
