import 'package:flutter/material.dart';

import '../customs/Auth_Containers/login_container.dart';
import '../customs/Auth_Containers/signup_container.dart';
import '../utils/app_colors.dart';
import '../utils/app_strings.dart';
import '../utils/text_style.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 1,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
               AppStrings.spaceXRockets,
              style: AppTextStyle.iFoodTextStyle,
            ),
            bottom: TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 3,
              tabs: [
                Tab(
                  icon: Icon(Icons.lock,
                      size: 20, color: AppColors.loginAndRegisterIconColors),
                  child: Text(
                    AppStrings.login,
                    style: AppTextStyle.authLoginAndRegister,
                  ),
                ),
                Tab(
                    icon: Icon(Icons.person,
                        size: 25, color: AppColors.loginAndRegisterIconColors),
                    child: Text(
                      AppStrings.register,
                      style: AppTextStyle.authLoginAndRegister,
                    ))
              ],
            ),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: AppColors.authBackGroundColors,
                ),
              ),
            ),
          ),
          body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: AppColors.authBackGroundColors)),
            child:   const TabBarView(children: [
              // LoginContainer(),
              SignUpContainer(),
            ]),
          ),
        ));
  }
}
