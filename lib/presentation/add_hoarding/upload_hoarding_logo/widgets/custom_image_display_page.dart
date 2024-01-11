import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:oohapp/core/app_export.dart';
import 'package:oohapp/presentation/add_hoarding/upload_hoarding_logo/widgets/cubit.dart';

class ImageDisplayContainer extends StatefulWidget {
  final File? image;
  final VoidCallback onRetry;
  final VoidCallback onClose;

  const ImageDisplayContainer({
    Key? key,
    this.image,
    required this.onRetry,
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
          loading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
     return BlocConsumer<ImageCubit, ImageState>(
      listener: (context, state) {
    
        if (state == ImageState.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('An error occurred. Please retry.')),
          );
        }
      },
      builder: (context, state) {
        // Return the UI based on the state
        Widget actionWidget;
        if (state == ImageState.loading) {
          actionWidget = CircularProgressIndicator();
        } else if (state == ImageState.error) {
          actionWidget = ElevatedButton(
            child: Text('Retry'),
            onPressed: () {
              BlocProvider.of<ImageCubit>(context).setImage(File('path_to_image'));
            },
          );
        } else {
          actionWidget = SizedBox.shrink();
        }
         return Stack(
      alignment: Alignment.topCenter,
      children: [
        // Image and loading indicator container
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
              image: widget.image != null
                  ? DecorationImage(
                      image: FileImage(widget.image!),
                      fit: BoxFit.cover,
                      colorFilter: loading
                          ? ColorFilter.mode(
                              Colors.black.withOpacity(0.5),
                              BlendMode.darken,
                            )
                          : null,
                    )
                  : null,
            ),
            child: loading
                ? CircularProgressIndicator()
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
        // Brand name TextField
        Positioned(
          bottom: 0,
          child: DottedBorder(
            color: Colors.grey,
            borderType: BorderType.RRect,
            radius: Radius.circular(12),
            padding: EdgeInsets.zero,
            dashPattern: [8, 4],
            strokeWidth: 2,
            child: Container(
              width: MediaQuery.of(context).size.width - 32, 
              height: 48,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter Brand Name',
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
      ],
         );
      }
    );
      }
     
  }

