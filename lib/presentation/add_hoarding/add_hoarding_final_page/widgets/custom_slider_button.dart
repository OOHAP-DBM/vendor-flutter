import 'package:flutter/material.dart';

class CustomSliderButton extends StatefulWidget {
  final String title;
  final bool initialValue;

  const CustomSliderButton({
    Key? key,
    required this.title,
    this.initialValue = false,
  }) : super(key: key);

  @override
  _CustomSliderButtonState createState() => _CustomSliderButtonState();
}

class _CustomSliderButtonState extends State<CustomSliderButton> {
  late bool isOn;

  @override
  void initState() {
    super.initState();
    isOn = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            widget.title,
            style: const TextStyle(
              color: Color(0xFF282C3E),
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        GestureDetector(
          onTap: _toggleSwitch,
          child: Container(
            width: 94,
            
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black),
            ),
            child: Stack(
              children: [
            
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.white, 
                      ),
                    ),
                 
                  ],
                ),
                // Slider
                Padding(
                  padding: const EdgeInsets.only(left: 4,right: 4,bottom: 2,top:2),
                  child: AnimatedAlign(
                    duration: const Duration(milliseconds: 300),
                    alignment: isOn ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      height: 27,
                      width: 50,
                      decoration: BoxDecoration(
                        color:  isOn ? Colors.blue : Colors.grey, 
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
            
                 Align(
                  alignment: Alignment.center,
                  child: Padding(
                   padding: const EdgeInsets.only(left: 4,right: 4,bottom: 2,top:2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(
                          child: Center(
                            child: Text(
                              'NO',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              'YES',
                              style: TextStyle(
                                color: isOn?Colors.white:Colors.black ,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _toggleSwitch() {
    setState(() {
      isOn = !isOn;
    });
  }
}
