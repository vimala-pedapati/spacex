

import 'package:fluttertoast/fluttertoast.dart';

import '../utils/app_colors.dart';



class ErrorToast {
  errorToast(String errorText){
        Fluttertoast.showToast(
        toastLength: Toast.LENGTH_SHORT,
        msg:  errorText,
        backgroundColor: AppColors.toastBackGroundColor,
        textColor: AppColors.toastTextColor);
  }
}
