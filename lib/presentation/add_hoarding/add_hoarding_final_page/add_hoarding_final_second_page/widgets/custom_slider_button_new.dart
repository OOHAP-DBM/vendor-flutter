import 'package:flutter/material.dart';

class NewCustomSliderButton extends StatefulWidget {
  final String title;
  final bool initialValue;
  final Function(bool)? onToggle;

  const NewCustomSliderButton({
    Key? key,
    required this.title,
    this.initialValue = false,
    this.onToggle,
  }) : super(key: key);

  @override
  _NewCustomSliderButtonState createState() => _NewCustomSliderButtonState();
}

class _NewCustomSliderButtonState extends State<NewCustomSliderButton> {
  late bool isOn;

  @override
  void initState() {
    super.initState();
    isOn = widget.initialValue;
  }

  void _toggleSwitch() {
    setState(() {
      isOn = !isOn;
    });

    if (widget.onToggle != null) {
      widget.onToggle!(isOn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                color: Color(0xFF282C3E),
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            const Text(
              'Are you providing this hoarding\n on weekly basis?',
              style: TextStyle(
                color: Color(0xFF282C3E),
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w300,
                height: 0,
              ),
            ),
          ],
        )),
            GestureDetector(
          onTap: _toggleSwitch,
          child: Container(
            width: 94,
           
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFF282C3E)),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
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
              ],
            ),
          ),
        ),
      ],
    );
  }


}
