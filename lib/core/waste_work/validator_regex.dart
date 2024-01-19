import 'package:email_validator/email_validator.dart';

class ValidatorRegex {
  static String? emailValidator(String? value) {
    if (value!.isEmpty) {
      return 'ⓘ Email is required';
    } else if (!EmailValidator.validate(value)) {
      return 'ⓘ Please enter a valid email';
    } else {
      return null;
    }
  }

  static String? nameValidator(String? value) {
    if (value!.isEmpty) {
      return 'Name is required';
    } else if (value.length < 3) {
      return 'Name must be at least 3 characters long';
    } else if (value.contains(' ')) {
      return 'Name should not contain spaces';
    } else if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
      return 'Please enter a valid name';
    } else {
      return null;
    }
  }
   static String? businessnameValidator(String? value) {
    if (value!.isEmpty) {
      return 'Business Name is required';
    } else if (value.length < 3) {
      return 'Business Name must be at least 3 characters long';
    }  else if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
      return 'Please enter a valid business name';
    } else {
      return null;
    }
  }
     static String? hoardingtitleValidator(String? value) {
    if (value!.isEmpty) {
      return 'Hoarding Title is required';
    } else if (value.length < 6) {
      return 'Hoarding Title must be at least 6 characters long';
    }  else if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
      return 'Please give a valid hoarding title';
    } else {
      return null;
    }
  }

     static String? hoardingdescriptionValidator(String? value) {
    if (value!.isEmpty) {
      return 'Hoarding Description is required';
    } else if (value.length < 6) {
      return 'Hoarding Description must be at least 6 characters long';
    }  else {
      return null;
    }
  }
     static String? accountholdernameValidator(String? value) {
    if (value!.isEmpty) {
      return 'accountholdername  is required';
    } else if (value.length < 3) {
      return 'accountholdername must be at least 3 characters long';
    }  else if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
      return 'Please enter a validaccountholdername';
    } else {
      return null;
    }
  }
   static String? ifscValidator(String? value) {
    if (value!.isEmpty) {
      return 'ifsc code  is required';
    } else if (value.length < 10) {
      return 'ifsc code  must be at least 10 characters long';
    }   else {
      return null;
    }
  }
  static String? addressValidator(String? value) {
    if (value!.isEmpty) {
      return 'Address is required';
    } else if (RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Address should not contain special characters';
    } else {
      return null;
    }
  }
    static String? hoardingaddressValidator(String? value) {
    if (value!.isEmpty) {
      return 'Hoarding Address is required';
    } else if (RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Hoarding Address should not contain special characters';
    } else {
      return null;
    }
  }

      static String? discounttypeValidator(String? value) {
    if (value!.isEmpty) {
      return 'discount type is required';
    } else if (RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'discount type should not contain special characters';
    } else {
      return null;
    }
  }
     static String? landmarkValidator(String? value) {
    if (value!.isEmpty) {
      return 'landmark is required';
    } else if (RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'landmark should not contain special characters';
    } else {
      return null;
    }
  }

  static String? aptUnitValidator(String? value) {
    if (value!.isEmpty) {
      return 'ⓘ Apt/unit is required';
    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'ⓘ Apt/unit should contain only numbers';
    } else {
      return null;
    }
  }
    static String? pincodeValidator(String? value) {
    if (value!.isEmpty) {
      return 'ⓘ pincode is required';
    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'ⓘ pincode should contain only numbers';
    } else {
      return null;
    }
  }

      static String? gstValidator(String? value) {
    if (value!.isEmpty) {
      return ' gst percentage is required';
    } else if (!RegExp(r'^[[0-9]{0,8}(\.[0-9]{1,4})?$|^[[0-9]{0,9}(\.[0-9]{1,3})?$|^[[0-9]{0,10}(\.[0-9]{1,2})?$|^[[0-9]{0,11}(\.[0-9]{1})?$|^[0-9]{0,12}').hasMatch(value)) {
      return 'enter valid percentage';
    } 
    else if (value.length>3) {
      return 'percentage cannot be of more than 3 digits';
    }else {
      return null;
    }
  }

        static String? igstValidator(String? value) {
    if (value!.isEmpty) {
      return ' igst percentage is required';
    } else if (!RegExp(r'^[[0-9]{0,8}(\.[0-9]{1,4})?$|^[[0-9]{0,9}(\.[0-9]{1,3})?$|^[[0-9]{0,10}(\.[0-9]{1,2})?$|^[[0-9]{0,11}(\.[0-9]{1})?$|^[0-9]{0,12}').hasMatch(value)) {
      return 'enter valid percentage';
    } 
    else if (value.length>3) {
      return 'percentage cannot be of more than 3 digits';
    }else {
      return null;
    }
  }

          static String? totalpricewithtaxValidator(String? value) {
    if (value!.isEmpty) {
      return '  total price with tax is required is required';
    } else if (!RegExp(r'^[[0-9]{0,8}(\.[0-9]{1,4})?$|^[[0-9]{0,9}(\.[0-9]{1,3})?$|^[[0-9]{0,10}(\.[0-9]{1,2})?$|^[[0-9]{0,11}(\.[0-9]{1})?$|^[0-9]{0,12}').hasMatch(value)) {
      return 'enter valid amount';
    } 
   else {
      return null;
    }
  }
         static String? discountpercentageamountValidator(String? value) {
    if (value!.isEmpty) {
      return ' discount/percenntage amount is required ';
    } else if (!RegExp(r'^[[0-9]{0,8}(\.[0-9]{1,4})?$|^[[0-9]{0,9}(\.[0-9]{1,3})?$|^[[0-9]{0,10}(\.[0-9]{1,2})?$|^[[0-9]{0,11}(\.[0-9]{1})?$|^[0-9]{0,12}').hasMatch(value)) {
      return 'enter valid amount';
    } 
   else {
      return null;
    }
  }
           static String? discountedpriceValidator(String? value) {
    if (value!.isEmpty) {
      return ' discounted price is required';
    } else if (!RegExp(r'^[[0-9]{0,8}(\.[0-9]{1,4})?$|^[[0-9]{0,9}(\.[0-9]{1,3})?$|^[[0-9]{0,10}(\.[0-9]{1,2})?$|^[[0-9]{0,11}(\.[0-9]{1})?$|^[0-9]{0,12}').hasMatch(value)) {
      return 'enter valid amount';
    } 
   else {
      return null;
    }
  }

     static String? measurementlengthValidator(String? value) {
    if (value!.isEmpty) {
      return 'measurement data is required';
    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'measurement data should contain only numbers';
    } else {
      return null;
    }
  }

       static String? hoardingheightValidator(String? value) {
    if (value!.isEmpty) {
      return 'hoarding height is required';
    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'hoarding height should contain only numbers';
    } else {
      return null;
    }
  }

        static String? hoardingwidthValidator(String? value) {
    if (value!.isEmpty) {
      return 'hoarding width is required';
    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'hoarding width should contain only numbers';
    } else {
      return null;
    }
  }
      static String? latitudevalidator(String? value) {
    if (value!.isEmpty) {
      return ' latitude is required';
    } else if (!RegExp("^(\\+|-)?((\\d((\\.)|\\.\\d{1,6})?)|(0*?[0-8]\\d((\\.)|\\.\\d{1,6})?)|(0*?90((\\.)|\\.0{1,6})?))").hasMatch(value)) {
      return ' enter a valid latitude ';
    } else {
      return null;
    }
  }

        static String? basepricevalidator(String? value) {
    if (value!.isEmpty) {
      return ' baseprice is required';
    } else if (!RegExp("^(\\+|-)?((\\d((\\.)|\\.\\d{1,6})?)|(0*?[0-8]\\d((\\.)|\\.\\d{1,6})?)|(0*?90((\\.)|\\.0{1,6})?))").hasMatch(value)) {
      return ' enter a valid amount';
    } else {
      return null;
    }
  }

          static String? pricingchargevalidator(String? value) {
    if (value!.isEmpty) {
      return ' printing charge is required';
    } else if (!RegExp("^(\\+|-)?((\\d((\\.)|\\.\\d{1,6})?)|(0*?[0-8]\\d((\\.)|\\.\\d{1,6})?)|(0*?90((\\.)|\\.0{1,6})?))").hasMatch(value)) {
      return ' enter a valid amount';
    } else {
      return null;
    }
  }
            static String? mountingchargevalidator(String? value) {
    if (value!.isEmpty) {
      return ' mounting charge is required';
    } else if (!RegExp("^(\\+|-)?((\\d((\\.)|\\.\\d{1,6})?)|(0*?[0-8]\\d((\\.)|\\.\\d{1,6})?)|(0*?90((\\.)|\\.0{1,6})?))").hasMatch(value)) {
      return ' enter a valid amount';
    } else {
      return null;
    }
  }

              static String? designingchargevalidator(String? value) {
    if (value!.isEmpty) {
      return ' designing charge is required';
    } else if (!RegExp("^(\\+|-)?((\\d((\\.)|\\.\\d{1,6})?)|(0*?[0-8]\\d((\\.)|\\.\\d{1,6})?)|(0*?90((\\.)|\\.0{1,6})?))").hasMatch(value)) {
      return ' enter a valid amount';
    } else {
      return null;
    }
  }
        static String? longitudevalidator(String? value) {
    if (value!.isEmpty) {
      return ' longitude is required';
    } else if (!RegExp("^(\\+|-)?((\\d((\\.)|\\.\\d{1,6})?)|(0*?\\d\\d((\\.)|\\.\\d{1,6})?)|(0*?1[0-7]\\d((\\.)|\\.\\d{1,6})?)|(0*?180((\\.)|\\.0{1,6})?))").hasMatch(value)) {
      return ' enter a valid longitude ';
    } else {
      return null;
    }
  }
   static String? accountnumberValidator(String? value) {
    if (value!.isEmpty) {
      return 'ⓘ accountnumber is required';
    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'ⓘ accountnumber should contain only numbers';
    } else {
      return null;
    }
  }

  static String? cityValidator(String? value) {
    if (value!.isEmpty) {
      return 'City is required';
    } else if (RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'City should not contain special characters';
    } else {
      return null;
    }
  }

  static String? zipCodeValidator(String? value) {
    if (value!.isEmpty) {
      return 'Zip code is required';
    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Zip code should contain only numbers';
    } else {
      return null;
    }
  }
  
  static String? gstinnoValidator(String? value) {
    if (value!.isEmpty) {
      return 'gstinno is required';
    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'gstinno should contain only numbers';
    } else {
      return null;
    }
  }
    static String? phoneNumberValidator(String? value) {
    if (value!.isEmpty) {
      return 'Phonenumber is required';
    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Phonenumber  should contain only numbers';
    } 
    else if(value.length!=10){
      return 'Phone number should contain only 10 digit';
    }
    else {
      return null;
    }
  }

  static String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return 'Password is required';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    } else if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).*$')
        .hasMatch(value)) {
      return 'Password must contain at least one uppercase letter, '
          'one lowercase letter, one numeric digit, '
          'and one special character';
    } else {
      return null;
    }
  }

  static String? dropdownValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please make a selection';
    } else {
      return null;
    }
  }

}