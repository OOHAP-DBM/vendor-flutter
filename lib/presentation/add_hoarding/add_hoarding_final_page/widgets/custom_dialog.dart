import '../../../../core/app_export.dart';

void showCustomDialog(
    BuildContext context, String title, String content, String imagePath) {
  showModalBottomSheet(
    context: context,
 
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.white,
        
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
       color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CustomText.secondaryTitle(color: Colors.black, text: title),
              SizedBox(height: 16.0),
              Text(
                content,
                style: const TextStyle(
                      color: CustomColors.grey,
                      fontWeight: FontWeight.w300,
                    ),
              ),
              SizedBox(height: 16.0),
             Container(height: 50,
             width:30,
               child: CustomImageView(
                          fit: BoxFit.fill,
                          imagePath: ImageConstant.hoarding,
                        ),
             ),
            ],
          ),
        ),
      );
    },
  );
}
