import 'package:flutter/material.dart';

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
        const Text( "Please Wait....", 
        style: TextStyle(fontSize: 12,), )

        ],
      ),
    );
    
  }
}

class CircularProgress{
  circleProgress(){
    return Container(
      
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 12),
      child: const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(
          Colors.blue
        ),
      ),
    );
  }
}