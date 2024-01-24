import 'package:oohapp/presentation/e_home_page/a_hoarding/hoarding_list/data_model/hoarding_list_data_mode.dart';

import '../../../../../core/app_export.dart';

class RecentlyBookedSection extends StatelessWidget {
  final Hoarding hoarding;

  const RecentlyBookedSection({Key? key, required this.hoarding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(hoarding.imagepathrecentlybookedby.length, (index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25,
              width: 68,
              child: CustomImageView(
                imagePath: hoarding.imagepathrecentlybookedby[index],
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              hoarding.namerecentlybookedby[index],
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 1, // Changed to 1 to fix potential layout issues
              ),
            ),
          ],
        );
      }),
    );
  }
}
