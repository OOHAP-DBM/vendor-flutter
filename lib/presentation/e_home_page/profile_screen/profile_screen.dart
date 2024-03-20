import 'package:oohapp/core/app_export.dart';
import 'package:oohapp/presentation/e_home_page/profile_screen/list_builder/list_options.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final ProfileMenu profileMenu = ProfileMenu();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Profile',
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircularButton(
              onPressed: () {
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
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText.secondaryTitle(
                      text: 'Digital Brain Media', textAlign: TextAlign.start),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText.inputText(
                          text: 'digital@gmail.com',
                          textAlign: TextAlign.start),
                      const Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 18,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              color: CustomColors.grey,
            ),
            /*  ListTile(
              title: CustomText.headlineText(
                  text: 'My Bookings', textAlign: TextAlign.start),
              leading: const Icon(Icons.paste),
            ),*/
            Padding(
              padding: const EdgeInsets.only(left: 14.0),
              child: ListView.builder(
                itemCount: profileMenu.profileMenuComponents.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      if (index == 0) {
                        Navigator.pushNamed(context, Routes.myBooking);
                      }
                    },
                    child: Column(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Row(
                            children: [
                              Icon(profileMenu.profileMenuComponents[index]
                                  ['icon']),
                              const SizedBox(
                                width: 15.0,
                              ),
                              CustomText.headlineText(
                                  text: profileMenu.profileMenuComponents[index]
                                      ['title']),
                            ],
                          ),
                        ),
                        if (index <
                            profileMenu.profileMenuComponents.length - 1)
                          const SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding: EdgeInsets.only(left: 40.0, top: 2.0),
                              child: Divider(
                                color: CustomColors.grey,
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14.0),
              child: CustomText.captionText(text: 'v1.0'),
            ),
          ],
        ),
      ),
    );
  }
}
