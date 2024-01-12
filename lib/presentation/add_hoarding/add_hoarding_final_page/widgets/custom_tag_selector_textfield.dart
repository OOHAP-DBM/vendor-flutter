import 'package:flutter/material.dart';

import '../../../../core/app_export.dart';
import '../../../../widgets/custom_text.dart';

class TagsInputField extends StatefulWidget {
  final String labelText;
  final List<String> initialTags;

  const TagsInputField({
    Key? key,
    required this.labelText,
    this.initialTags = const [],
  }) : super(key: key);

  @override
  _TagsInputFieldState createState() => _TagsInputFieldState();
}

class _TagsInputFieldState extends State<TagsInputField> {
  final TextEditingController _textController = TextEditingController();
  late List<String> _tags;

  @override
  void initState() {
    super.initState();
    _tags = List.from(widget.initialTags);
  }

  void _addTag(String tag) {
    if (tag.isNotEmpty && !_tags.contains(tag)) {
      setState(() {
        _tags.add(tag);
      });
      _textController.clear();
    }
  }

  void _removeTag(String tag) {
    setState(() {
      _tags.removeWhere((t) => t == tag);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText.primaryTitle(
          text: 'Add Audience',
          color: Colors.black,
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
          height: ScaleSize.height(5.66),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: TextField(
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            controller: _textController,
            decoration: InputDecoration(
              hintText: 'Add target audience',
              focusColor: CustomColors.inactiveButton,
              labelStyle: const TextStyle(color: CustomColors.inactiveButton),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 2.0,
                horizontal: 8.0,
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: CustomColors.blackColor,
                ),
              ),
              counterText: '',
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: CustomColors.blackColor),
                borderRadius: BorderRadius.circular(4.0),
              ),
              suffixIcon: IconButton(
                icon: const Icon(Icons.add),
                onPressed: () => _addTag(_textController.text),
              ),
            ),
            onSubmitted: _addTag,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          children: _tags.map((tag) {
            return Chip(
              backgroundColor: const Color(0xFFD9F2E6),
              label: Text(
                tag,
                style: const TextStyle(
                  color: Color(0xFF1E1B18),
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              onDeleted: () => _removeTag(tag),
            );
          }).toList(),
        ),
      ],
    );
  }
}
