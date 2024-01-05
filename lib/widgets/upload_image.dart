import 'package:oohapp/core/app_export.dart';

class UploadImage extends StatelessWidget {
  const UploadImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            radius: 56,
            backgroundColor: CustomColors.liteGrey,
            child: Padding(
              padding: const EdgeInsets.all(10.0), // Border radius
              child: ClipOval(
                child: CustomImageView(
                  width: 200,
                  height: 200,
                  fit: BoxFit.fill,
                  imagePath: ImageConstant.baby,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 7,
            child: Container(
              decoration: BoxDecoration(
                  /* border: Border.all(
                    width: 3,
                    color: CustomColors.liteGrey,
                  ),*/
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      50,
                    ),
                  ),
                  color: CustomColors.liteGrey,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(2, 4),
                      color: Colors.black.withOpacity(
                        0.3,
                      ),
                      blurRadius: 3,
                    ),
                  ]),
              child: const Padding(
                padding: EdgeInsets.all(5.0),
                child: Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.black,
                  size: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
