import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/app_export.dart';

class SecondLocationHoardingPage extends StatelessWidget {
  const SecondLocationHoardingPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Hoarding location',
        centerTitle: true,
        elevation: 1,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.clear),
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          const GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(26.8467, 80.9462),
              zoom: 16,
            ),
            myLocationButtonEnabled: false,
          ),
          Positioned(
              top: MediaQuery.of(context).padding.top + 20,
              child: SizedBox(
                width: 343,
                height: 70,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 270,
                          child: Text(
                            'B 25, Second Floor, Vibhuti Khand Rd, Vibhuti Khand, Gomti Nagar, Lucknow, Uttar Pradesh 226010',
                            style: TextStyle(
                              color: CustomColors.grey,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        NavigateUtils.pushNamedReplacement(
                            context, Routes.firsthoardinglocationScreen);
                      },
                      child: const Text(
                        'Change',
                        style: TextStyle(
                          color: Color(0xFF009A5C),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          DraggableScrollableSheet(
            initialChildSize: 0.1,
            minChildSize: 0.1,
            maxChildSize: 0.4,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18),
                  ),
                ),
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return const ListTile(
                      title: Text(
                        'Drag the map to pin your accurate location',
                        style: TextStyle(
                          color: CustomColors.grey,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      trailing: Icon(Icons.keyboard_arrow_up),
                    );
                  },
                ),
              );
            },
          ),
          Positioned(
            bottom: 50,
            left: 16,
            right: 16,
            child: CustomButton(
              onTap: () {
                NavigateUtils.pushNamedReplacement(
                    context, Routes.fisthoardinglocationentryScreen);
              },
              text: 'Continue',
              backgroundColor: const Color(0xFF282C3E),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.15,
            child: const Icon(
              Icons.location_pin,
              color: Colors.red,
              size: 50,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.3,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {},
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Text(
                    'Change',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}