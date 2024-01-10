import 'package:flutter/material.dart';

class CustomCheckboxTile extends StatefulWidget {
  final String title;
  final bool initialValue;
  final ValueChanged<bool> onChanged;

  const CustomCheckboxTile({
    Key? key,
    required this.title,
    this.initialValue = false,
     required this.onChanged,
  }) : super(key: key);

  @override
  _CustomCheckboxTileState createState() => _CustomCheckboxTileState();
}

class _CustomCheckboxTileState extends State<CustomCheckboxTile> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.title),
      value: _isChecked,
      onChanged: (newValue) {
        setState(() {
          _isChecked = newValue ?? false;
          widget.onChanged(_isChecked);
        });
      },
      activeColor: Colors.green,
      checkColor: Colors.white,
      controlAffinity: ListTileControlAffinity.leading, 
    );
  }
}
