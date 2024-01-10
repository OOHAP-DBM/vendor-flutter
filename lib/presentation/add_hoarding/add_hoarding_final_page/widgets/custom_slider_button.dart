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
        Expanded(child: Text(widget.title)),
        GestureDetector(
          onTap: _toggleSwitch,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: 35.0,
            width: 70.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: isOn ? Colors.blue : Colors.grey[300],
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment:
                      isOn ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    height: 35.0,
                    width: 35.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'NO',
                        style: TextStyle(
                          color: isOn ? Colors.white : Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'YES',
                        style: TextStyle(
                          color: isOn ? Colors.grey : Colors.white,
                          fontWeight: FontWeight.bold,
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

  void _toggleSwitch() {
    setState(() {
      isOn = !isOn;
    });
  }
}
