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
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
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
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
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

      widget.onToggle?.call(isOn);
    });
  }
}
