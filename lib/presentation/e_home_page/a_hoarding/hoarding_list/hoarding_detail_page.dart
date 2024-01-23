import 'package:carousel_slider/carousel_slider.dart';
import 'package:oohapp/presentation/e_home_page/a_hoarding/hoarding_list/data_model/hoarding_list_data_mode.dart';

import '../../../../core/app_export.dart';

class MyHoardingDetailPage extends StatefulWidget {
  final Hoarding hoarding;

  const MyHoardingDetailPage({
    super.key,
    required this.hoarding,
  });

  @override
  State<MyHoardingDetailPage> createState() => _MyHoardingDetailPageState();
}

class _MyHoardingDetailPageState extends State<MyHoardingDetailPage> {
  int _current = 0;
   final CarouselController _carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'My Hoarding',
        centerTitle: true,
        elevation: 1,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: CircularButton(
            onTap: () {
              Navigator.pop(context);
            },
            backgroundColor: CustomColors.grey,
            borderColor: CustomColors.transparent,
            icon: Icons.arrow_back,
            iconColor: CustomColors.blackColor,
          ),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    clipBehavior: Clip.none,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.share,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: 24,
                    height: 24,
                    clipBehavior: Clip.none,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.more_vert,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              left: 16.0, right: 16.0, top: 32, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            CarouselSlider.builder(
                            carouselController: _carouselController,
            itemCount: widget.hoarding.imagePaths.length,
            options: CarouselOptions(
              viewportFraction: 1.0,
              autoPlay: false,
              enlargeCenterPage: false,
              height: 210,
              
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
            itemBuilder: (context, index, realIdx) {
              return Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Image.asset(widget.hoarding.imagePaths[index],
                      fit: BoxFit.cover,
                      height: 210),
                  Positioned(
                        top: -10, 
                        right: 0,
                        child: Container(
                          width: 89,
                          height: 25,
                          decoration: BoxDecoration(
                            color: widget.hoarding.isPublished ? Color(0xFF009A5C) : Colors.red, // Color based on published status
                            borderRadius: BorderRadius.circular(12.5),
                          ),
                      child: Center(
                        child: Text(
                          widget.hoarding.statusText,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    bottom: 30,
                    child: Text(
                      '${index + 1}/${widget.hoarding.imagePaths.length}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),

          Container(
            width: double.infinity,
            color: Colors.black.withAlpha(50), // Semi-transparent background
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: widget.hoarding.imagePaths.asMap().entries.map((entry) {
                    return GestureDetector(
                onTap: () => _carouselController.animateToPage(entry.key),
                      child: Container(
                        width: 12.0,
                        height: 12.0,
                        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness == Brightness.dark
                                  ? Colors.white
                                  : Colors.black)
                              .withOpacity(_current == entry.key ? 0.9 : 0.4),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
            ],
          ),
        ),
      ),
    );
  }
}
