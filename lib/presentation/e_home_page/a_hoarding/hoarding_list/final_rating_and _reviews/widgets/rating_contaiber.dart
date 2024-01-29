import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RatingContainerWidget extends StatelessWidget {
  const RatingContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                height: 160,
                width: double.infinity,
                decoration: const BoxDecoration(color: Colors.white),
                child: Card(
                  elevation: 2.0,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 18, top: 12, bottom: 12, right: 18),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 112,
                          height: 146,
                          decoration: const ShapeDecoration(
                            color: Color(0xFF0089E1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(6),
                                bottomLeft: Radius.circular(6),
                              ),
                            ),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment
                                .center, // Aligns children to the center
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '4.0/5',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                              Text(
                                'Excellent',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: ListView(
                            children: [
                              _buildRatingRow('Excellent', 0.59, Colors.blue),
                              _buildRatingRow('Very Good', 0.23, Colors.blue),
                              _buildRatingRow('Average', 0.08, Colors.blue),
                              _buildRatingRow('Poor', 0.04, Colors.blue),
                              _buildRatingRow('Bad', 0.06, Colors.blue),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
  }
   Widget _buildRatingRow(String label, double value, Color color) {
    return Row(
      crossAxisAlignment:
          CrossAxisAlignment.center, // Aligns children vertically center
      children: [
        SizedBox(
          width:
              70, // Set a fixed width for the label to align the start of the progress bars
          child: Text(
            label,
            style: const TextStyle(
              color: Color(0xFF282C3E),
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Stack(
              children: <Widget>[
                Container(
                  width:
                      115, // Ensures the background takes up all available space
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                Container(
                  width:
                      115 * value, // Adjusts the width according to the value
                  height: 4,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ],
            ),
          ),
        ),
        Text('${(value * 100).toInt()}%',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Poppins',
            )),
      ],
    );
  }
}