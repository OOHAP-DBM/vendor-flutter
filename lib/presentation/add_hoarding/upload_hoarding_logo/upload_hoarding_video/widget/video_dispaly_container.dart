 import 'package:oohapp/presentation/add_hoarding/upload_hoarding_logo/upload_hoarding_video/cubit/cubit.dart';
import 'package:oohapp/presentation/add_hoarding/upload_hoarding_logo/upload_hoarding_video/cubit/cubit_data_model.dart';
import 'package:oohapp/presentation/add_hoarding/upload_hoarding_logo/upload_hoarding_video/widget/image_tile.dart';


import '../../../../../core/app_export.dart';

class ImageGridView extends StatelessWidget {
  const ImageGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MediaCubit, MediaData>(
      builder: (context, mediaData) {
        return Column(
          children: [
            GestureDetector(
              onTap: () {
             
              },
              child: mediaData.videos.isNotEmpty
                  ? ImageTile(
                    height: 167,
                    width: 376,
                      imageFile: mediaData.videos.first,
                      onTap: () {},
                      onClose: () {
                        BlocProvider.of<MediaCubit>(context).removeVideo(mediaData.videos.first);
                      },
                    )
                  : Container(), 
                        ),
                        SizedBox(height: 12,),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemCount: mediaData.videos.length - (mediaData.videos.isNotEmpty ? 1 : 0), // Adjust for empty list
              itemBuilder: (context, index) {
    
                int gridIndex = index + (mediaData.videos.isNotEmpty ? 1 : 0);
                return ImageTile(
                  width:76,
                  height: 69,
                  imageFile: mediaData.videos[gridIndex],
                  onTap: () {
                 
                    BlocProvider.of<MediaCubit>(context).swapvideos(gridIndex);
                  },
                  onClose: () {
                    BlocProvider.of<MediaCubit>(context).removeVideo(mediaData.videos[gridIndex]);
                  },
                );
              },
            ),
            
          ],
        );
      },
    );
  }
}