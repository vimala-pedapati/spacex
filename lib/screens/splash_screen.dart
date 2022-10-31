import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tbib_splash_screen/splash_screen_view.dart';

import '../global.dart';
import '../tab_container.dart';
import '../utils/app_strings.dart';
import 'auth_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 10), () async {
      /// --- Checking if the user already logined or not ----- ///
      // Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => const TabContainer(),
      //     ));
      if (firebaseAuth.currentUser != null) {
        // user logined
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const TabContainer()));
      } else {
        // user not logined
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const AuthScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 50),
              child: Lottie.asset("assets/splash.json"),
            ),
            // const SizedBox(
            //   height: 100,
            // ),
            AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText(
                   AppStrings.splashText,

                  textStyle: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                  colors: [
                    Colors.blue,
                    Colors.blue.shade900,
                    Colors.red.shade200,
                    Colors.blue.shade800,
                    Colors.red.shade900,
                    Colors.blue.shade200,
                    Colors.red.shade800,
                  ],

                  // colors: Colors.blue,
                ),
              ],
              isRepeatingAnimation: true,
              onTap: () {
                print("Tap Event");
              },
            )
          ],
        ),
      ),
    );
  }
}
