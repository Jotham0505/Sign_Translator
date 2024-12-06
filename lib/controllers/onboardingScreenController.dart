import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:sih_project/Screens/mainScreen.dart';
import 'package:sih_project/Screens/onboardingScreen.dart';

class OnboardingScreenController extends GetxController {
  late List<String> imgPaths;
  late List<Widget> pages;
  final PageController pageController = PageController(initialPage: 0);

  int pageNo = 0;
  OnboardingScreenController() {
    imgPaths = ['1', '2', '3'];
  }

  Timer? timer;

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (pageController.page == imgPaths.length - 1) {
        pageController.animateToPage(0,
            duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      } else {
        pageController.nextPage(
            duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      }
    });
  }

  void btnPressed() {
    Get.to(() => Mainscreen());
  }

  @override
  void onInit() {
    super.onInit();

    pages = List.generate(
      imgPaths.length,
      (index) => ImgPlaceHolder(
        imgpath: imgPaths[index],
      ),
    );
    startTimer();
  }

  @override
  void onClose() {
    timer?.cancel();
    // TODO: implement onClose
    super.onClose();
}
}