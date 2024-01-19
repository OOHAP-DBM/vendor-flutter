import 'package:flutter/material.dart';
import 'package:oohapp/core/app_export.dart';
import 'package:oohapp/presentation/e_home_page/a_hoarding/hoarding_list/data_model/hoarding_list.dart';

class MyHordingListPage extends StatelessWidget {
  const MyHordingListPage({super.key});

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
      body: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsDirectional.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                'All Hoardings: ${hoardings.length}K',
                style: TextStyle(
                  // Style as per your design
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(), // to disable ListView's scrolling
                itemCount: hoardings.length,
                itemBuilder: (context, index) {
                  final hoarding = hoardings[index];
                  return Card(
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Image.asset(hoarding.imagePath), // Hoarding image
                      title: Text(hoarding.title),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(hoarding.location),
                          Text(hoarding.category),
                          Text(hoarding.size),
                        ],
                      ),
                      trailing: Switch(
                        value: hoarding.status == 'Published',
                        onChanged: (bool value) {
                         
                        },
                      ),
                    ),
                  );
                },
              ),
              ],
            ),
            
          ),
        ),
      ),
    );
  }
}
