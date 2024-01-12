import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../core/app_export.dart';
import 'location_data_model/location_suggestion_data_model.dart';

class FirstHoardingLocationPage extends StatefulWidget {
  FirstHoardingLocationPage({super.key});

  @override
  State<FirstHoardingLocationPage> createState() => _FirstHoardingLocationPageState();
}

class _FirstHoardingLocationPageState extends State<FirstHoardingLocationPage> {
 final TextEditingController _searchController = TextEditingController();
   Widget _buildSearchField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Search location',
          prefixIcon: Icon(Icons.search),
          suffixIcon: IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              _searchController.clear();
              _updateSearchResults('');
            },
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey[200],
        ),
        onChanged: _updateSearchResults,
      ),
    );
  }
  bool _isSearching = false;

  List<LocationSuggestion> _filteredLocationSuggestions = [];

  @override
  void initState() {
    super.initState();

    _filteredLocationSuggestions = _locationSuggestions;
  }
    final List<LocationSuggestion> _locationSuggestions = [
    LocationSuggestion(
      name: 'Gomti Nagar, Lucknow, Uttar Pradesh, India',
      latitude: 26.850000,
      longitude: 80.949997
    ),
      LocationSuggestion(
      name: 'Gomti Nagar, Lucknow, Uttar Pradesh, India',
      latitude: 26.850000,
      longitude: 80.949997
    ),
      LocationSuggestion(
      name: 'Gomti Nagar, Lucknow, Uttar Pradesh, India',
      latitude: 26.850000,
      longitude: 80.949997
    ),
      LocationSuggestion(
      name: 'Gomti Nagar, Lucknow, Uttar Pradesh, India',
      latitude: 26.850000,
      longitude: 80.949997
    ),
         LocationSuggestion(
      name: 'Gomti Nagar, Lucknow, Uttar Pradesh, India',
      latitude: 26.850000,
      longitude: 80.949997
    ),
         LocationSuggestion(
      name: 'Gomti Nagar, Lucknow, Uttar Pradesh, India',
      latitude: 26.850000,
      longitude: 80.949997
    ),
         LocationSuggestion(
      name: 'Gomti Nagar, Lucknow, Uttar Pradesh, India',
      latitude: 26.850000,
      longitude: 80.949997
    ),
    

    // ... other suggestions
  ];
    void _updateSearchResults(String query) {
    setState(() {
      _isSearching = query.isNotEmpty;
      _filteredLocationSuggestions = query.isEmpty
          ? _locationSuggestions
          : _locationSuggestions.where((suggestion) {
              return suggestion.name.toLowerCase().contains(query.toLowerCase());
            }).toList();
    });
  }

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
            child: _buildSearchBar(context),
          ),
          if (_isSearching) _buildSearchResults(),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: _buildConfirmButton(context),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return GestureDetector(
      onTap: () => _settingModalBottomSheet(context),
      child: Container(
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
        child: AbsorbPointer(
          child: TextFormField(
            controller: _searchController,
            decoration: const InputDecoration(
              hintText: 'Where is your hoarding located?',
              hintStyle: TextStyle(
                color: CustomColors.blackColor,
                fontWeight: FontWeight.w300,
              ),
              prefixIcon: Icon(Icons.search, color: Colors.black),
              suffixIcon:
                Icon(Icons.mic,color: Colors.black,), 
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
            ),
          ),
        ),
      ),
    );
  }

   
  void _settingModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (builder) {
          return DraggableScrollableSheet(
            expand: false,
            builder: (_, scrollController) {
              return Container(
                padding: const EdgeInsets.only(top: 10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0)
                  )
                ),
                child: Column(
                  children: [
                    _buildSearchField(),
                    Expanded(
                      child: ListView.builder(
                        controller: scrollController,
                        itemCount: _filteredLocationSuggestions.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Text(_filteredLocationSuggestions[index].name),
                            onTap: () {
                              // Handle the tap event
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        });
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

  Widget _buildConfirmButton(BuildContext context) {
    return CustomButton(
      onTap: () {
        Navigator.pushNamed(context, Routes.secondhoardinglocationScreen);
      },
      text: 'Confirm Location',
      backgroundColor: const Color(0xFF282C3E),
    );
  }

}