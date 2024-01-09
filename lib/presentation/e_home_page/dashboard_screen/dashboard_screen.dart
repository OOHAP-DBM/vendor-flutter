import 'package:oohapp/core/app_export.dart';
import 'package:oohapp/presentation/e_home_page/dashboard_screen/sale_chart/sale_chart.dart';
import 'dummy_data/item_list.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: Colors.white,
      appBar: CustomAppBar(
        leading: CustomSvgImageView(
          svgPath: ImageConstant.vendorLogoWithLeftAlign,
          fit: BoxFit.contain,
        ),
        actions: [
          CircularButton(
            onTap: () {
              CustomSnackBar(
                      color: Colors.redAccent,
                      text: 'Notification clicked',
                      second: 1,
                      icon: Icons.notifications_none)
                  .showSnackBar(context);
            },
            icon: Icons.notifications_none,
            iconColor: CustomColors.blackColor,
          ),
          const SizedBox(
            width: 8.0,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: CustomCircleImage(
              onTap: () {
                CustomSnackBar(
                        color: Colors.redAccent,
                        text: 'Profile clicked',
                        second: 1,
                        icon: Icons.image)
                    .showSnackBar(context);
              },
              imagePath: ImageConstant.baby,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              height: ScaleSize.height(22),
              //  height: ScaleSize.height(100),
              // height: MediaQuery.of(context).size.height,
              // padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 14.0),
              width: ScaleSize.width(100),
              color: CustomColors.liteGrey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText.inputText(
                            text: "Grow your business with",
                            color: CustomColors.blackColor,
                            fontStyle: FontStyle.italic),
                        CustomText.inputText(
                            text: "OOHAPP!",
                            fontStyle: FontStyle.italic,
                            color: CustomColors.blackColor),
                        const SizedBox(
                          height: 10.0,
                        ),
                        CustomButton(
                            width: ScaleSize.width(40),
                            backgroundColor: CustomColors.buttonColor,
                            onTap: () {
                              NavigateUtils.pushNamedReplacement(context, Routes.addhoardingScreen);
                              // CustomSnackBar(
                              //         color: Colors.redAccent,
                              //         text: 'Hording clicked',
                              //         second: 1,
                              //         icon: Icons.image)
                              //     .showSnackBar(context);
                            },
                            text: '+ Add Hoarding'),
                      ],
                    ),
                    SizedBox(
                      height: ScaleSize.height(15),
                      width: ScaleSize.width(22),
                      child: CustomImageView(
                        fit: BoxFit.fill,
                        imagePath: ImageConstant.hoarding,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // List here

            /*  const SizedBox(
              height: 20,
            ),*/
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(
                    color: CustomColors.grey,

                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomText.secondaryTitle(
                    text: 'Your Dashboard',
                    color: CustomColors.blackColor,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: itemList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            height: ScaleSize.height(7),
                            width: ScaleSize.width(100),
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            //color: Colors.red,
                            decoration: BoxDecoration(
                              color: itemColors[index % itemColors.length],
                              // borderRadius: BorderRadius.circular(8.0),
                          /*    border: Border.all(
                                color: CustomColors.blackColor,
                              ),*/
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomText.headlineText(
                                  text: itemList[index]['title'].toString(),
                                  color: CustomColors.blackColor,
                                ),
                                const Spacer(),
                                CustomText.headlineText(
                                  text: itemList[index]['value'].toString(),
                                  color: CustomColors.blackColor,
                                ),
                                const SizedBox(width: 10.0),
                                const Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: CustomColors.blackColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                  // Sale chart widget here *************
                  SaleChart(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
