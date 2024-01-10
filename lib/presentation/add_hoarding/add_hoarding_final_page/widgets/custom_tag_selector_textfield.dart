import 'package:flutter/material.dart';

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
              color:Colors.black,

            ),
            SizedBox(
              height: 12,
            ),
        TextField(
          controller: _textController,
          decoration: InputDecoration(
            hintText: 'Add target audience',
            border: OutlineInputBorder(),
            suffixIcon: IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _addTag(_textController.text),
            ),
          ),
          onSubmitted: _addTag,
        ),
        SizedBox(height: 8),
        Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          children: _tags.map((tag) {
            return Chip(
              label: Text(tag),
              onDeleted: () => _removeTag(tag),
            );
          }).toList(),
        ),
      ],
    );
  }
}
