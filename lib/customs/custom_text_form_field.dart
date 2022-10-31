import 'package:flutter/material.dart';


import '../utils/text_style.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {this.controller,
        this.textInputType,
        this.hintText,
        this.prefixIcon,
        required this.isObscureText,
        required this.isEnabled,
        this.textInputAction,
        Key? key})
      : super(key: key);
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final String? hintText;
  final IconData? prefixIcon;
  final bool? isObscureText;
  final bool? isEnabled;
  final TextInputAction? textInputAction;
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.fromLTRB(10, 3, 20, 0),
        margin: const EdgeInsets.only(left: 10, right: 10),
        height: 50,
        decoration: BoxDecoration(
          // border: Border.all(color: Colors.black),
            color: Colors.white,
            borderRadius: BorderRadius.circular(100)),
        child: TextField(
          keyboardType: textInputType,
          cursorColor: Colors.grey,
          cursorHeight: 17,
          cursorWidth: 2.5,
          controller: controller,
          obscureText: isObscureText!,
          enabled: isEnabled,
          textInputAction: textInputAction,
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              prefixIcon,
              size: 25,
              color: Colors.blue,
            ),
            hintText: hintText,
            hintStyle: AppTextStyle.textFieldHintTextStyle,
          ),
          style: AppTextStyle.textFieldTextStyle,
        ));
  }
}
