import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripple_wave/ripple_wave.dart';
import 'package:sih_project/Screens/onboardingScreen.dart';
import 'package:sih_project/widgets/bouncingIcon.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = Get.height;
    double screenWidth = Get.width;

    return AnimatedSplashScreen(
      backgroundColor: const Color(0XFFCEAAFF),
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Expanded ensures the image is centered vertically
          Expanded(
            flex: 5,
            child: RippleWave(
              color: const Color(0XFFD9D9D9),
              duration: const Duration(milliseconds: 1500),
              child: BouncingIcon(
                child: SizedBox(
                  height: screenHeight / 3.41,
                  width: screenWidth / 1.622,
                  child: Image.asset('assets/images/splashlogo.png'),
                ),
              ),
            ),
          ),
          // Expanded with a flex of 1 pushes the text to the bottom
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: 20.0), // Optional: Add padding to bottom
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Powered By ',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "DMSansRegular",
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Pub',
                      style: TextStyle(
                          color: Color(0XFF474747),
                          fontFamily: "DMSansRegular",
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Dev',
                      style: TextStyle(
                          color: Color(0XFF001EFF),
                          fontFamily: "DMSansRegular",
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      duration: 1500,
      nextScreen: OnboardingScreen(),
      splashIconSize: 800,
);
}
}