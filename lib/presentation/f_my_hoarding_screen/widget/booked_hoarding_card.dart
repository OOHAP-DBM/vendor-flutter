import '../../../core/app_export.dart';
import '../../../widgets/custom_network_cache_image.dart';

class BookedHordingCardWidget extends StatelessWidget {
  final String imageUrl;
  final String hoardingLocation;
  final String hoardingCity;
  final String hoardingType;
  final String hoardingScreenType;
  final Color? shadowColor;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final BoxShadow? boxShadow;
  final double? hoardingLocationFontSize;
  final double? imageHeight;
  final double? imageWidth;
  final double? borderRadius;

  const BookedHordingCardWidget({
    super.key,
    required this.imageUrl,
    required this.hoardingLocation,
    required this.hoardingCity,
    required this.hoardingType,
    required this.hoardingScreenType,
    this.shadowColor,
    this.backgroundColor,
    this.padding,
    this.boxShadow,
    this.hoardingLocationFontSize,
    this.imageHeight,
    this.imageWidth,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding ?? EdgeInsets.symmetric(horizontal: 7.w),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(borderRadius ?? 10.sp),
        boxShadow: [
              BoxShadow(
                color: shadowColor ?? Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: imageHeight ?? 70.h,
                width: imageWidth ?? 100.w,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: CustomCachedNetworkImage(
                    imageUrl: imageUrl,
                  ),
                ),
              ),
              SizedBox(
                width: 6.w,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText.text(
                      text: hoardingLocation,
                      fontWeight: FontWeight.w600,
                      fontSize: hoardingLocationFontSize ?? 13.sp,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    CustomText.text(
                        text: hoardingCity,
                        fontSize: 12.sp,
                        overflow: TextOverflow.ellipsis,
                        color: Colors.grey),
                    SizedBox(
                      height: 1.h,
                    ),
                    CustomText.text(
                      text: hoardingScreenType,
                      fontSize: 12.sp,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomText.text(
                          text: 'Hoarding Type:',
                          overflow: TextOverflow.ellipsis,
                          fontSize: 12.sp,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        CustomText.text(
                            text: hoardingType,
                            fontSize: 12.sp,
                            color: Colors.blue),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
