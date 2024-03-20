import '../core/app_export.dart';

class CustomBottomSheet {
  static Future<void> showSheet(BuildContext context, Widget child,
      {double? height}) async {
    await showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: height ?? MediaQuery.of(context).size.height * 0.6,
          padding: EdgeInsets.all(16.0.r),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0.r),
              topRight: Radius.circular(20.0.r),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 6.0,
                offset: const Offset(0, -3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  child: child,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
