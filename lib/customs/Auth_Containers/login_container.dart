
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spacex/tab_container.dart';


import '../../global.dart';
import '../../screens/auth_screen.dart';
import '../../utils/app_strings.dart';
import '../../utils/text_style.dart';
import '../../utils/validations.dart';
import '../custom_text_form_field.dart';

import '../error_toast.dart';
import '../loading_dialog.dart';

class LoginContainer extends StatefulWidget {
  const LoginContainer({Key? key}) : super(key: key);

  @override
  State<LoginContainer> createState() => _LoginContainerState();
}

class _LoginContainerState extends State<LoginContainer> {
  /// Form Keys
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  /// Controllers
  final TextEditingController mailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    mailController.clear();
    passwordController.clear();
    super.dispose();
  }

  loginNow(mail, password) async {
    showDialog(
        context: context,
        builder: (context) => LoadingDialog(
          message: AppStrings.checkingCredentials,
        ));
    if (Validate().mail(mail)) {
      try {
        await firebaseAuth
            .signInWithEmailAndPassword(email: mail, password: password)
            .then((auth) {
          Navigator.pop(context);
           Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const  TabContainer()));


        });
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        ErrorToast().errorToast(e.message.toString());
        Navigator.pushReplacement(context, MaterialPageRoute(builder:  (context)=> const AuthScreen()));
      }
    } else {
      Navigator.pop(context);
    }
  }



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 40.h,
            width: 80.w,
            child: Lottie.asset("assets/rocket.json"),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(left: 5.w, right: 5.w),
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
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

                    /// Password
                    CustomTextFormField(
                      controller: passwordController,
                      textInputType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                      hintText: AppStrings.passwordHintText,
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
                        loginNow(mailController.text.trim(),
                            passwordController.text.trim());
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors. blue.shade900,
                      ),
                      child: Text(AppStrings.login,
                          style: AppTextStyle.authLoginAndRegister),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
