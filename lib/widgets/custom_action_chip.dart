/*
import 'package:flutter/material.dart';

class ReusableActionChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final Function(bool)? onSelect;
  final Color? backgroundColor;
  final Color? labelColor;
  final Color? borderColor;
  final double padding;

  const ReusableActionChip({super.key,
    required this.icon,
    required this.label,
    this.selected = false,
    this.onSelect,
    this.backgroundColor,
    this.labelColor,
    this.borderColor,
    this.padding = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      avatar: Icon(icon, color: selected ? Colors.white : null),
      label: Text(
        label,
        style: TextStyle(color: labelColor ?? Colors.black),
      ),
      onPressed: onSelect != null ? () => onSelect!(true) : null,
      backgroundColor: selected ? (backgroundColor ?? Colors.blue) : null,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: borderColor ?? Colors.transparent),
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: EdgeInsets.all(padding),
    );
  }
}
*/
