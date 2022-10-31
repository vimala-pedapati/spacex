import 'package:fluttertoast/fluttertoast.dart';

import 'app_colors.dart';
import 'app_strings.dart';

class Validate{
  bool name(String name){
    Pattern pattern = r"^[a-zA-Z. ]{3,50}$";
    RegExp regex = RegExp(pattern.toString());
    if (regex.hasMatch(name)) {
      print(regex.hasMatch(name).toString());
      return true;
    }else{
      Fluttertoast.showToast(
          toastLength: Toast.LENGTH_LONG ,
          msg: AppStrings.invalidName,
          backgroundColor: AppColors.toastBackGroundColor,
          textColor: AppColors.toastTextColor);
      return  false;
    }
  }
  bool mail(String mail){
    Pattern pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regex = RegExp(pattern.toString());
    if(regex.hasMatch(mail)){
      return true;
    }else{
      Fluttertoast.showToast(
          toastLength: Toast.LENGTH_LONG ,
          msg: AppStrings.invalidMailAddress,
          backgroundColor: AppColors.toastBackGroundColor,
          textColor: AppColors.toastTextColor);
      return false;
    }

  }

  


  bool password(String password){
    if(password.isNotEmpty && password.length >=6 ){
      return true;
    }else{
      Fluttertoast.showToast(
          toastLength: Toast.LENGTH_LONG ,
          msg: AppStrings.invalidPassword,
          backgroundColor: AppColors.toastBackGroundColor,
          textColor: AppColors.toastTextColor);
      return false;
    }
  }

  bool passAndCpassCheck(String pass, String cPass){
    if (pass.trim() == cPass.trim()){
     return  true;
    }else{
      Fluttertoast.showToast(
         toastLength: Toast.LENGTH_LONG ,
         msg: AppStrings.passwordsShouldMatch,
         backgroundColor: AppColors.toastBackGroundColor,
         textColor: AppColors.toastTextColor);
      return false;
    }
  }
  bool mobileNumber(String mobileNumber){
    Pattern pattern = r"^[0-9]{10,10}$";
    RegExp regex = RegExp(pattern.toString());
    if(regex.hasMatch(mobileNumber)){
      return true;
    }else{
      Fluttertoast.showToast(
          toastLength: Toast.LENGTH_LONG ,
          msg: AppStrings.invalidMobileNumber,
          backgroundColor: AppColors.toastBackGroundColor,
          textColor: AppColors.toastTextColor);
      return false;
    }

  }
  bool location(String location){
    if(location.isNotEmpty){
      return true;
    }else{
      Fluttertoast.showToast(
          toastLength: Toast.LENGTH_LONG ,
          msg: AppStrings.invalidLocation,
          backgroundColor: AppColors.toastBackGroundColor,
          textColor: AppColors.toastTextColor);
      return false;
    }
  }

}