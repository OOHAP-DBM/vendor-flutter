import 'dart:js';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/app_export.dart';
import 'location_data_model/location_suggestion_data_model.dart';

class FirstHoardingLocationPage extends StatefulWidget {
  const FirstHoardingLocationPage({super.key});

  @override
  State<FirstHoardingLocationPage> createState() =>
      _FirstHoardingLocationPageState();
}

class _FirstHoardingLocationPageState extends State<FirstHoardingLocationPage> {
    final List<LocationSuggestion> _locationSuggestions = [
    LocationSuggestion(name: 'Gomti Nagar, Lucknow, Uttar Pradesh, India', latitude: 26.850000, longitude: 80.949997),
    LocationSuggestion(name: 'Hazratganj, Lucknow, Uttar Pradesh, India', latitude: 26.8333, longitude: 80.9167),
        LocationSuggestion(name: 'Hazratganj, Lucknow, Uttar Pradesh, India', latitude: 26.8333, longitude: 80.9167),
            LocationSuggestion(name: 'Hazratganj, Lucknow, Uttar Pradesh, India', latitude: 26.8333, longitude: 80.9167),
                LocationSuggestion(name: 'Hazratganj, Lucknow, Uttar Pradesh, India', latitude: 26.8333, longitude: 80.9167),
                    LocationSuggestion(name: 'Hazratganj, Lucknow, Uttar Pradesh, India', latitude: 26.8333, longitude: 80.9167),
  ];
  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return DraggableScrollableSheet(
            expand: false,
            builder: (_, controller) {
              return Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(10.0),
                        topRight: const Radius.circular(10.0))),
                child: ListView.builder(
                  controller: controller,
                  itemCount: _locationSuggestions.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(_locationSuggestions[index].name),
                      onTap: () {
                        // Handle location selection here if needed
                      },
                    );
                  },
                ),
              );
            },
          );
        });
  }
  final TextEditingController _searchController = TextEditingController();
  final bool _isSearching = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Hoarding location',
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
      ),
      body: Stack(
        children: [
          const GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(26.8467, 80.9462),
              zoom: 14.0,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top,
            left: 0,
            right: 0,
            child: _buildSearchBar(),
          ),
          if (_isSearching) _buildSearchResults(),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: _buildConfirmButton(),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      width: 343,
      height: 46,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(46),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 8,
            offset: Offset(2, 2),
            spreadRadius: 0,
          )
        ],
      ),
      child: GestureDetector(
        onTap: ()=>_settingModalBottomSheet(context),
        child: AbsorbPointer(
          child: TextFormField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Where is your hoarding located?',
              hintStyle: const TextStyle(
                color: CustomColors.grey,
                fontWeight: FontWeight.w300,
              ),
              prefixIcon: (_isSearching)
                  ? const Icon(
                      Icons.search,
                      color: Colors.black,
                    )
                  : const Icon(Icons.location_pin, color: Colors.black),
              suffixIcon: (_isSearching) ? Icon(Icons.mic) : Container(),
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildSearchResults() {
  return Container(
    color: Colors.white,
    child: ListView(
      children: const [
        ListTile(title: Text('Gomti Nagar, Lucknow, Uttar Pradesh, India')),
      ],
    ),
  );
}

Widget _buildConfirmButton() {
  return CustomButton(
    onTap: () {
      NavigateUtils.pushNamedReplacement(
          context, Routes.secondhoardinglocationScreen);
    },
    text: 'Confirm Location',
    backgroundColor: const Color(0xFF282C3E),
  );
}
