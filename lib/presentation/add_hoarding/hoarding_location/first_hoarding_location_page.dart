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
      padding:  EdgeInsets.symmetric(horizontal: 16),
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
          padding:  EdgeInsets.symmetric(horizontal: 8.0),
          child: CircularButton(
            onPressed: () {
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

           Positioned.fill(
            child: Image.asset(
              ImageConstant.map, // Replace with your local asset path
              fit: BoxFit.cover,
            ),
          ),
          //  GoogleMap(
          //   initialCameraPosition: CameraPosition(
          //     target: LatLng(26.8467, 80.9462),
          //     zoom: 14.0,
          //   ),
          // ),
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
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
        
        child: AbsorbPointer(
          child: TextFormField(
            controller: _searchController,
            decoration:  InputDecoration(
          hintText: 'Where is your hoarding located?',
          hintStyle:  TextStyle(
            fontSize: 16, // Your desired font size
            color: Color(0xFF282C3E), // Your desired text color
          ),
         contentPadding:  EdgeInsets.symmetric(vertical: 10),
          prefixIcon:  Icon(Icons.location_on, color: Colors.black),
    
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20), // Rounded corners
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white.withAlpha(235),
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
                padding:  EdgeInsets.only(top: 10),
                decoration:  BoxDecoration(
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
        children:  [
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
      backgroundColor:  Color(0xFF282C3E),
    );
  }

}