import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:oohapp/core/app_export.dart';
import 'package:oohapp/presentation/add_hoarding/upload_hoarding_logo/widgets/cubit/cubit.dart';
import 'package:oohapp/presentation/add_hoarding/upload_hoarding_logo/widgets/custom_logo_entry_text_formfield.dart';

class ImageDisplayContainer extends StatefulWidget {
  final File image;
  final VoidCallback onClose;

  const ImageDisplayContainer({
    Key? key,
    required this.image,
    required this.onClose,
  }) : super(key: key);

  @override
  _ImageDisplayContainerState createState() => _ImageDisplayContainerState();
}

class _ImageDisplayContainerState extends State<ImageDisplayContainer> {
  bool loading = true;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          Navigator.pop(context);
          loading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            DottedBorder(
              color: Colors.grey,
              borderType: BorderType.RRect,
              radius: Radius.circular(12),
              padding: EdgeInsets.all(6),
              dashPattern: [8, 4],
              strokeWidth: 2,
              child: Container(
                width: double.infinity,
                height: 167,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  image: DecorationImage(
                    image: FileImage(widget.image),
                    fit: BoxFit.cover,
                    colorFilter: loading
                        ? ColorFilter.mode(
                            Colors.black.withOpacity(0.5),
                            BlendMode.darken,
                          )
                        : null,
                  ),
                ),
                child: loading
                    ? Center(child: CircularProgressIndicator())
                    : SizedBox.shrink(),
              ),
            ),
            // Close button
            Positioned(
              right: 8,
              top: 8,
              child: IconButton(
                icon: Icon(Icons.close, color: Colors.grey),
                onPressed: widget.onClose,
              ),
            ),
          ],
        ),
        CustomLogoEntryTextFormField(
          text: 'Enter logo name',
        ),
      ],
    );
  }
}
