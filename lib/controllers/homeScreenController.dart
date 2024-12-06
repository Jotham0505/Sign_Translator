import 'package:sih_project/Screens/Assessment/mainAssScreen.dart';
import 'package:sih_project/Screens/numbersListScreen.dart';
import 'package:sih_project/controllers/alphabetsListController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sih_project/controllers/numbersListController.dart';
import 'package:sih_project/screens/alphabetsListScreen.dart';
import 'package:sih_project/widgets/lockDialogWidget.dart';

class HomeScreenController extends GetxController {
  AlphabetsListController alphabetsListController =
      Get.put(AlphabetsListController());
  Numberslistcontroller numberslistcontroller = Get.put(Numberslistcontroller());

  String userName = 'Hemanth Kumar';
  String letterTitle = 'Letters';
  String letterSubTitle = 'Learn letter and signs';
  double letterRange = 0.25;
  bool isLetterCompleted = true;
  String letterImg = "letters";
  String numbersTitle = 'Numbers';
  String numberSubTitle = 'Learn numbers and signs';
  double numberRange = 0.0;
  bool isNumberCompleted = true;
  String numberImg = "numbers";
  String mathTitle = 'Maths';
  String mathSubTitle = 'Learn to do arithmetic signs';
  double mathRange = 0.0;
  bool isMathCompleted = false;
  String mathImg = "mathshome";

  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: ImageIcon(
        size: 24,
        AssetImage('assets/images/homecap.png'),
      ),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: GestureDetector(
        onTap: () => Get.to(() => Mainassscreen()),
        child: ImageIcon(
          size: 24,
          AssetImage('assets/images/assessment.png'),
        ),
      ),
      label: 'Assessment',
    ),
    BottomNavigationBarItem(
      icon: ImageIcon(
        size: 24,
        AssetImage('assets/images/report.png'),
      ),
      label: 'Report',
    ),
  ];

  void handleLevelPressing(int idx) {
    switch (idx) {
      case 1:
        alphabetsListController.alphabets.clear();
        alphabetsListController.createAlphabetList();
        alphabetsListController.update();
        //print(alphabetsListController.alphabets);
        Get.to(() => AlphabetListScreen());
        break;
      case 2:
        numberslistcontroller.numbers.clear();
        numberslistcontroller.createNumberList();
        numberslistcontroller.update();
        Get.to(() => NumberListScreen());
      //   break;
      // case 3:
      //   Get.to();
    }
  }

  void lockedLevelPressed(
      BuildContext context, double screenHeight, double screenWidth) {
    LockDialogWidget.showLockDialog(context, screenHeight, screenWidth);
}

  // List<TabItem> items = [
  //   TabItem(
  //     icon: SizedBox(
  //       height: 24,
  //       width: 24,
  //       child: Image.asset('assets/images/homecap.png'),
  //     ),
  //     title: 'Home',
  //   ),
  //   TabItem(
  //     icon: Icons.search_sharp,
  //     title: 'Shop',
  //   ),
  //   TabItem(
  //     icon: Icons.favorite_border,
  //     title: 'Wishlist',
  //   ),
  //   TabItem(
  //     icon: Icons.shopping_cart_outlined,
  //     title: 'Cart',
  //   ),
  //   TabItem(
  //     icon: Icons.account_box,
  //     title: 'profile',
  //   ),
  // ];
}
