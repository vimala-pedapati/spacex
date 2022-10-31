import 'package:flutter/material.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spacex/customs/progress_indicator.dart';

import '../utils/app_strings.dart';
import '../utils/font_family.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({Key? key, required this.message}) : super(key: key);
  final String message;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // height: 100,
      // color: Colors.white,
      backgroundColor: Colors.white,
      title: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgress().circleProgress(),
          const SizedBox(height: 25,),
          Text(message+AppStrings.plaeseWait,
            style: TextStyle(fontFamily: FontFamily.kiwimaruFontFamily,fontSize: 12,), )

        ],
      ),
    );

  }
}