





import '../../../../../../core/app_export.dart'; // Ensure this has the necessary imports for CustomText, CustomButton, etc.

class ReviewDeleteOptionSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
            width: double.infinity,
            height: 200,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(19),
                  topRight: Radius.circular(19),
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 10,left: 39,right: 39,bottom: 24),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText.subHeadingText(
                   text: 'Are you sure you want to delete \nreviews?',
                   color:   Color(0xFF282C3E)
                  ),
                  SizedBox(height: 12,),
                  CustomButton(onTap: (){
                    Navigator.pop(context);
                  }, text: 'Cancel',
                  backgroundColor: Color(0xFF282C3E),
                  width: double.infinity,),
                  SizedBox(height: 12,),
                   CustomButton(onTap: (){
                    Navigator.pop(context);
                  }, text: 'Yes',
                  width: double.infinity,),
                ],
              ),
            ),
          );
  }
}
