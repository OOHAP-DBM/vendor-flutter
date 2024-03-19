
import '../../../../../core/app_export.dart';
import '../../widgets/custom_network_cache_image.dart';
import 'image_viewer_app_bar.dart';

class ImageViewerScreen extends StatefulWidget {
  const ImageViewerScreen({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  State<ImageViewerScreen> createState() => _ImageViewerScreenState();
}

class _ImageViewerScreenState extends State<ImageViewerScreen> {
  double _scale = 1.0;
  double _previousScale = 1.0;
  Offset _offset = Offset.zero;
  Offset _previousOffset = Offset.zero;
  bool _isAppBarShow = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: _isAppBarShow
          ? ImageScreenAppBar(
        title: 'You',
        dateTime: 'Yesterday 09:23 AM',
        starOnPressed: () {},
        shareOnPressed: () {},
        moreOnPressed: () {},
      )
          : null,
      body: GestureDetector(
        onDoubleTap: () {
          setState(() {
            _scale = _scale == 1.0 ? 2.0 : 1.0;
          });
        },
        onTap: () {
          setState(() {
            _isAppBarShow = !_isAppBarShow;
          });
        },
        onScaleStart: (details) {
          _previousScale = _scale;
          _previousOffset = details.focalPoint;
        },
        onScaleUpdate: (details) {
          setState(() {
            _scale = _previousScale * details.scale;
            _offset = details.focalPoint - _previousOffset;
          });
        },
        onScaleEnd: (_) {
          _previousOffset = Offset.zero;
        },
        child: Center(
          child: Transform.scale(
            scale: _scale,
            // child: Image.network(
            //   widget.imageUrl,
            //   fit: BoxFit.contain,
            // ),
            child: CustomCachedNetworkImage(imageUrl: widget.imageUrl),
          ),
        ),
      ),
    );
  }
}
