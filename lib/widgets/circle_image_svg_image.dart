import 'package:oohapp/core/app_export.dart';

class CustomCircleImage extends StatelessWidget {
  const CustomCircleImage({
    Key? key,
    this.alignment,
    this.onTap,
    this.url,
    required this.imagePath,
    this.color,
    this.height,
    this.width,
    required this.fit,
  }) : super(key: key);

  final double? height;
  final double? width;
  final Color? color;
  final BoxFit fit;
  final Alignment? alignment;
  final VoidCallback? onTap;
  final String? url;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(100),
      child: CircleAvatar(
        radius: 17,
        backgroundColor: color ?? CustomColors.liteGrey,
        child: ClipOval(
          child: CustomImageView(
            width: width ?? 35,
            //height: height ?? 35,
            fit: BoxFit.fill,
            imagePath: imagePath,
          ),
        ),
      ),
    );

    /*  return ClipOval(
      child: Container(
        width: width ?? 40,
        height: height ?? 40,
        padding: const EdgeInsets.all(8.0),
        //color: Colors.red,
        decoration: BoxDecoration(
          color: CustomColors.grey,
         */ /* border: Border.all(
            color: CustomColors.blackColor,
          ),*/ /*
        ),
        child: Image.asset(
          imagePath,
          fit: fit,
        ),
      ),
    );*/
  }
}
