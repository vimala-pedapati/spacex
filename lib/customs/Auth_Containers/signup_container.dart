import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:spacex/tab_container.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../../global.dart';

import '../../utils/app_strings.dart';
import '../../utils/text_style.dart';
import '../../utils/validations.dart';
import '../custom_text_form_field.dart';
import '../error_toast.dart';
import '../loading_dialog.dart';

class SignUpContainer extends StatefulWidget {
  const SignUpContainer({Key? key}) : super(key: key);

  @override
  State<SignUpContainer> createState() => _SignUpContainerState();
}

class _SignUpContainerState extends State<SignUpContainer> {
  /// Form Key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  /// controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

  @override
  void dispose() {
    nameController.clear();
    mailController.clear();
    phoneNumberController.clear();
    passwordController.clear();
    confirmController.clear();

    // imageXFile = null;
    // sellerImageUrl = "";
    super.dispose();
  }

  authenticateSellersAndSignUp() async {


    try {
      await firebaseAuth
          .createUserWithEmailAndPassword(
              email: mailController.text.trim(),
              password: passwordController.text.trim())
          .then((auth) {
        Navigator.pop(context);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const TabContainer()));
      });
    } on FirebaseAuthException catch (e) {
      print("error ....................................[RED]");
      Navigator.pop(context);
      ErrorToast().errorToast(e.message.toString());
    }

  }

  onSignUpButtonPressed({
    required String name,
    required String mail,
    required String mobileNumber,
    required password,
    required cPassword,
  }) {
    if (Validate().name(name) &&
        Validate().mail(mail) &&
        Validate().mobileNumber(mobileNumber) &&
        Validate().password(password) &&
        Validate().passAndCpassCheck(password, cPassword)) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return LoadingDialog(message: AppStrings.registeringAccount);
          });
      authenticateSellersAndSignUp();

    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 10.w,
          ),

          /// sign up Form
          Padding(
            padding: EdgeInsets.only(left: 5.w, right: 5.w),
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    /// Name
                    CustomTextFormField(
                      controller: nameController,
                      textInputType: TextInputType.name,
                      hintText: AppStrings.nameHintText,
                      prefixIcon: Icons.person,
                      isObscureText: false,
                      isEnabled: true,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    /// E mail
                    CustomTextFormField(
                      controller: mailController,
                      textInputType: TextInputType.emailAddress,
                      hintText: AppStrings.mailHintText,
                      prefixIcon: Icons.mail,
                      isObscureText: false,
                      isEnabled: true,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    /// Phone Number
                    CustomTextFormField(
                      controller: phoneNumberController,
                      textInputType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                      hintText: AppStrings.phoneNumberHintText,
                      prefixIcon: Icons.phone,
                      isObscureText: false,
                      isEnabled: true,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    /// Password
                    CustomTextFormField(
                      controller: passwordController,
                      textInputType: TextInputType.visiblePassword,
                      hintText: AppStrings.passwordHintText,
                      prefixIcon: Icons.lock,
                      isObscureText: true,
                      isEnabled: true,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    /// Confirm Password
                    CustomTextFormField(
                      controller: confirmController,
                      textInputType: TextInputType.visiblePassword,
                      hintText: AppStrings.confirmPasswordHintText,
                      prefixIcon: Icons.lock,
                      isObscureText: true,
                      isEnabled: true,
                      textInputAction: TextInputAction.done,
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    /// Sign Up Button

                    ElevatedButton(
                      onPressed: () {
                        print(mailController.text.trim());
                        print(passwordController.text.trim());
                        print(phoneNumberController.text.trim());
                        onSignUpButtonPressed(
                          name: nameController.text,
                          mail: mailController.text,
                          mobileNumber: phoneNumberController.text,
                          password: passwordController.text,
                          cPassword: confirmController.text,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade900,
                      ),
                      child: Text(
                        AppStrings.signUp,
                        style: AppTextStyle.authLoginAndRegister,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
