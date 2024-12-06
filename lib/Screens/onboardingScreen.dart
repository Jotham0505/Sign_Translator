import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sih_project/controllers/onboardingScreenController.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = Get.height;
    double screenWidth = Get.width;
    TextScaler textScale = MediaQuery.of(context).textScaler;
    return GetBuilder(
      init: OnboardingScreenController(),
      builder: (OnboardingScreenController obsController) {
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: screenWidth,
                    height: screenHeight,
                    child: PageView.builder(
                      controller: obsController.pageController,
                      itemCount: obsController.imgPaths.length,
                      itemBuilder: (context, index) {
                        return obsController.pages[index];
                      },
                      onPageChanged: (value) {
                        obsController.pageNo = value;
                        obsController.update();
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0XFFFFFEFE),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                      ),
                      height: screenHeight / 2.25,
                      width: screenWidth,
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: screenHeight / 57.14,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: screenWidth / 8.18),
                            child: SizedBox(
                              width: screenWidth / 1.65,
                              height: screenHeight / 12.69,
                              child: Text(
                                'GUJARAT',
                                style: GoogleFonts.ebGaramond().copyWith(
                                  fontSize: textScale.scale(48),
                                  color: Color(0XFF9747FF),
                                ),
                                // TextStyle(
                                //   fontSize: textScale.scale(48),
                                //   color: Color(0XFF9747FF),
                                // ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: screenHeight / 29.62,
                          ),
                          SizedBox(
                            width: screenWidth / 1.32,
                            height: screenHeight / 5.10,
                            child: Text(
                              'Gujarat\'s culture is a vibrant blend of tradition and modernity, rich in heritage and diverse traditions. Known as the land of legends, it celebrates life through spirited festivals, colorful arts, and warm hospitality. Gujarat offers a unique cultural experience that embodies India\'s unity in diversity.',
                              style: TextStyle(
                                fontFamily: "DMSansBlack",
                                fontSize: textScale.scale(14),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: screenHeight / 32.56,
                    width: screenWidth,
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            obsController.imgPaths.length,
                            (index) => Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth / 75),
                              child: CircleAvatar(
                                radius: 5,
                                backgroundColor: obsController.pageNo == index
                                    ? Color(0XFF9747FF)
                                    : Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: screenHeight / 32.56,
                      right: screenWidth / 18,
                      child: TextButton(
                          onPressed: obsController.btnPressed,
                          child: Text(
                            'NEXT>',
                            style: TextStyle(
                              fontFamily: "DMSansSemiBold",
                              fontSize: textScale.scale(14),
                              color: Color(0XFF9747FF),
                            ),
                          )))
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class ImgPlaceHolder extends StatelessWidget {
  final String imgpath;
  const ImgPlaceHolder({super.key, required this.imgpath});

  @override
  Widget build(BuildContext context) {
    double screenHeight = Get.height;
    return Column(
      children: [
        Image.asset(
          "assets/images/onboarding/$imgpath.png",
          height: screenHeight / 1.60, // Adjust the height to fit your needs
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        // Add other content here if needed below the image
],
);
}
}