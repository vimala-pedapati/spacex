import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';

import 'app_colors.dart';
import 'app_strings.dart';


class CheckNetworkConnection {
  static void internetLookUp() async {
    try {
      await InternetAddress.lookup('google.com').catchError((e) {
        Fluttertoast.showToast(
            toastLength: Toast.LENGTH_LONG ,
            msg: AppStrings.noInternetConnection,
            backgroundColor: AppColors.toastBackGroundColor,
            textColor: AppColors.toastTextColor);

      });
    } catch (err) {
      Fluttertoast.showToast(
          toastLength: Toast.LENGTH_LONG ,
          msg: AppStrings.noInternetConnection,
          backgroundColor:AppColors.toastBackGroundColor,
          textColor: AppColors.toastTextColor);

    }
  }

}
