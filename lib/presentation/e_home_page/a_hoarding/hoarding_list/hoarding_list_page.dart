import 'package:oohapp/core/app_export.dart';
import 'package:oohapp/presentation/e_home_page/a_hoarding/hoarding_list/data_model/hoarding_list.dart';
import 'package:oohapp/presentation/e_home_page/a_hoarding/hoarding_list/data_model/hoarding_list_data_mode.dart';
import 'package:oohapp/presentation/e_home_page/a_hoarding/hoarding_list/hoarding_detail_page.dart';

class MyHordingListPage extends StatefulWidget {
  MyHordingListPage({super.key});

  @override
  State<MyHordingListPage> createState() => _MyHordingListPageState();
}

class _MyHordingListPageState extends State<MyHordingListPage> {
  bool isswitched = false;
  bool _isPublishedSelected = true;
  bool _isLoading = false; // To show loading indicator
  List<Hoarding> _filteredHoardings = [];

  @override
  void initState() {
    super.initState();
    _filteredHoardings = hoardings;
  }

  void _filterHoardings(String filter) {
    setState(() {
      _isLoading = true; // Start loading
    });

    // Simulate a network request or heavy computation delay
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        if (filter == 'Published') {
          _filteredHoardings =
              hoardings.where((hoarding) => hoarding.isPublished).toList();
        } else if (filter == 'Unpublished') {
          _filteredHoardings = hoardings
              .where(
                  (hoarding) => !hoarding.isPublished && hoarding.isAvailable)
              .toList();
        } else if (filter == 'Upcoming') {
          _filteredHoardings =
              hoardings.where((hoarding) => !hoarding.isAvailable).toList();
        } else {
          _filteredHoardings = hoardings; // Or apply other filters as needed
        }
        _isLoading = false; // Stop loading
      });
    });
  }

  void _showSortBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Sort By',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  ListTile(
                    title: const Text('Published'),
                    leading: Radio<bool>(
                      value: true,
                      groupValue: _isPublishedSelected,
                      onChanged: (bool? value) {
                        setModalState(() {
                          _isPublishedSelected = value!;
                        });
                      },
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text('Unpublished'),
                    leading: Radio<bool>(
                      value: false,
                      groupValue: _isPublishedSelected,
                      onChanged: (bool? value) {
                        setModalState(() {
                          _isPublishedSelected = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: CustomButton(
                      width: 170,
                      onTap: () {
                        // Apply the filter for Published or Unpublished
                        String filter =
                            _isPublishedSelected ? 'Published' : 'Unpublished';
                        _filterHoardings(filter);
                        Navigator.pop(context); // Dismiss the bottom sheet
                      },
                      backgroundColor: Color(0xFF282C3E),
                      text: 'Apply',
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'My Hoarding',
        centerTitle: true,
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                  onTap: () {},
                  child: const Text(
                    ' +Add New',
                    style: TextStyle(
                      color: Color(0xFF009A5C),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ))),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              left: 16.0, right: 16.0, top: 32, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: ScaleSize.width(76),
                      height: 44,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 1, color: Color(0xFFA6A0A0)),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      child: TextField(
                        onTapOutside: (event) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          focusColor: CustomColors.inactiveButton,
                          labelStyle:
                              TextStyle(color: CustomColors.inactiveButton),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 2.0,
                            horizontal: 8.0,
                          ),
                          prefixIcon: Icon(Icons.search_rounded),
                          hintText: 'Search For Hoarding',
                          hintStyle: TextStyle(
                            color: CustomColors.grey,
                            fontWeight: FontWeight.w300,
                          ),
                          prefixIconColor: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      width: 46,
                      height: 44,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignCenter,
                            color: Color(0xFFA6A0A0),
                          ),
                          borderRadius: BorderRadius.circular(9),
                        ),
                      ),
                      child: PopupMenuButton<String>(
                        color: Colors.white,
                        onSelected: (String value) {
                          if (value == 'Published' || value == 'Unpublished') {
                            // Open bottom sheet with selected value
                            _isPublishedSelected = (value == 'Published');
                            _showSortBottomSheet(context);
                          } else if (value == 'Upcoming') {
                            // Directly filter for upcoming hoardings
                            _filterHoardings(value);
                          }
                        },
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<String>>[
                          const PopupMenuItem<String>(
                            value: 'Published',
                            textStyle: TextStyle(color: Colors.black),
                            child: Text('Published'),
                          ),
                          const PopupMenuItem<String>(
                            value: 'Unpublished',
                            textStyle: TextStyle(color: Colors.black),
                            child: Text('Unpublished'),
                          ),
                          const PopupMenuItem<String>(
                            value: 'Upcoming',
                            textStyle: TextStyle(color: Colors.black),
                            child: Text('Upcoming'),
                          ),
                        ],
                        child: Center(
                          child: CustomImageView(
                            fit: BoxFit.fill,
                            imagePath: ImageConstant.sideicon,
                          ),
                        ),
                      ),
                    )

                    // Container(
                    //   width: ScaleSize.width(12),
                    //   height: 44,
                    //   clipBehavior: Clip.antiAlias,
                    //   decoration: ShapeDecoration(
                    //     color: Colors.white,
                    //     shape: RoundedRectangleBorder(
                    //       side: const BorderSide(
                    //         width: 1,
                    //         strokeAlign: BorderSide.strokeAlignCenter,
                    //         color: Color(0xFFA6A0A0),
                    //       ),
                    //       borderRadius: BorderRadius.circular(9),
                    //     ),
                    //   ),
                    //   child: Center(
                    //     child: CustomImageView(
                    //       fit: BoxFit.fill,
                    //       imagePath: ImageConstant.sideicon,
                    //     ),
                    //   ),
                    // )
                  ]),
              const SizedBox(
                height: 18,
              ),
              Text(
                'All Hoardings: ${hoardings.length}K',
                style: const TextStyle(),
              ),
              const SizedBox(
                height: 16,
              ),
              _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _filteredHoardings.length,
                      itemBuilder: (context, index) {
                        final hoarding = _filteredHoardings[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    MyHoardingDetailPage(hoarding: hoarding),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            width: double.infinity,
                            height: 180,
                            padding: const EdgeInsets.only(bottom: 8),
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 1, color: Color(0xFFE0E0E0)),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                hoarding.isAvailable
                                    ? Container(
                                        width: double.infinity,
                                        height: 40,
                                        color: hoarding.backgroundColor,
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomText.secondaryTitle(
                                                text: hoarding.statusText,
                                                color: hoarding.textColor,
                                              ),
                                              Switch(
                                                value: hoarding.isPublished,
                                                onChanged: (bool value) {
                                                  setState(() {
                                                    hoarding.togglePublished();
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : Container(
                                        width: double.infinity,
                                        height: 40,
                                        color: const Color(0xFFEBEBEB),
                                        alignment: Alignment.center,
                                        child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            child: Center(
                                                child: CustomText.secondaryTitle(
                                                    text:
                                                        'Available in ${hoarding.daysAvailable} days',
                                                    color: CustomColors
                                                        .blackColor))),
                                      ),

                                const SizedBox(
                                  height: 8,
                                ),

                                // Align(
                                //   alignment: Alignment.topRight,
                                //   child: Transform.scale(
                                //     scale: 0.7,
                                //     child: Switch(
                                //       value: hoarding.status == 'Published',
                                //       onChanged: (bool value) {},
                                //       activeTrackColor: Colors.lightGreenAccent,
                                //       activeColor: Colors.green,
                                //     ),
                                //   ),
                                // ),
                                ListTile(
                                  leading: SizedBox(
                                    width: 70,
                                    height: 80,
                                    child: CustomImageView(
                                      imagePath: hoarding.imagePaths
                                          .first, // Display the first image
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CustomText.secondaryTitle(
                                        text: hoarding.title,
                                      ),
                                      Text(
                                        hoarding.location,
                                        style: const TextStyle(
                                          color: CustomColors.grey,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Category:',
                                            style: TextStyle(
                                              color: CustomColors.blackColor,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                          Text(
                                            hoarding.category,
                                            style: const TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Size:',
                                            style: TextStyle(
                                              color: CustomColors.blackColor,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                          Text(
                                            hoarding.size,
                                            style: const TextStyle(
                                              color:
                                                  CustomColors.inactiveButton,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
