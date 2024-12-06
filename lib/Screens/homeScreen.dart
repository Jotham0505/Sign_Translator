import 'package:sih_project/controllers/homeScreenController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sih_project/widgets/homeLevelList.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    double screenHeight = Get.height;
    double screenWidth = Get.width;
    TextScaler textScale = MediaQuery.of(context).textScaler;
    return GetBuilder<HomeScreenController>(
      init: HomeScreenController(),
      builder: (HomeScreenController hcontroller) {
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: EdgeInsets.only(
                  left: screenWidth / 15, right: screenWidth / 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenHeight / 30.76,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: screenHeight / 16.67,
                        width: screenWidth / 7.5,
                        child: Image.asset('assets/images/appbarimg.png'),
                      ),
                      SizedBox(
                        width: screenWidth / 45,
                      ),
                      Column(
                        children: [
                          Text(
                            'Welcome Back!',
                            style: TextStyle(
                              fontFamily: "DMSansRegular",
                              fontSize: textScale.scale(14),
                              color: Color(0XFF8B8DA5),
                            ),
                          ),
                          Text(
                            hcontroller.userName,
                            style: TextStyle(
                              fontFamily: "DMSansRegular",
                              fontSize: textScale.scale(16),
                              color: Color(0XFF47475D),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: screenWidth / 3.17,
                      ),
                      SizedBox(
                        height: screenHeight / 33.33,
                        width: screenWidth / 15,
                        child: Image.asset('assets/images/bell.png'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight / 16.67,
                  ),
                  Text(
                    'Start Learning Today',
                    style: TextStyle(
                      fontFamily: "DMSansBlack",
                      fontSize: textScale.scale(18),
                      color: Color(0XFF47475D),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight / 66.67,
                  ),
                  Container(
                    height: screenHeight / 6.89,
                    width: screenWidth / 1.15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0XFFDBC0FF),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: screenWidth / 22.5),
                      child: Row(
                        children: [
                          SizedBox(
                            width: screenWidth / 2.05,
                            height: screenHeight / 9.52,
                            child: Text(
                              '"શિક્ષણ એ મજા છે, જ્યારે આપણે તેને હૃદયથી શીખીએ છીએ!"',
                              style: TextStyle(
                                fontFamily: "DMSansBlack",
                                fontWeight: FontWeight.w900,
                                fontSize: textScale.scale(15),
                                color: Color(0XFF47475D),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: screenWidth / 3.05,
                            height: screenHeight / 6.89,
                            child: Image.asset('assets/images/leohome.png'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight / 18.18,
                  ),
                  Text(
                    'Upcoming Levels',
                    style: TextStyle(
                      fontFamily: "DMSansBlack",
                      fontSize: textScale.scale(18),
                      color: Color(0XFF47475D),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight / 30.76,
                  ),
                  HomeLevelWidget(
                    idx: 1,
                    title: hcontroller.letterTitle,
                    subtitle: hcontroller.letterSubTitle,
                    range: hcontroller.letterRange,
                    isUnlocked: hcontroller.isLetterCompleted,
                    imgPath: hcontroller.letterImg,
                  ),
                  SizedBox(
                    height: screenHeight / 25,
                  ),
                  HomeLevelWidget(
                    idx: 2,
                    title: hcontroller.numbersTitle,
                    subtitle: hcontroller.numberSubTitle,
                    range: hcontroller.numberRange,
                    isUnlocked: hcontroller.isNumberCompleted,
                    imgPath: hcontroller.numberImg,
                  ),
                  SizedBox(
                    height: screenHeight / 25,
                  ),
                  HomeLevelWidget(
                    idx: 3,
                    title: hcontroller.mathTitle,
                    subtitle: hcontroller.mathSubTitle,
                    range: hcontroller.mathRange,
                    isUnlocked: hcontroller.isMathCompleted,
                    imgPath: hcontroller.mathImg,
                  ),
                  SizedBox(
                    height: screenHeight / 25,
                  ),
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: hcontroller.items,
              //backgroundColor: Colors.green,
              selectedItemColor: Color(0XFF47475D),
              //currentIndex: currentIndex,
              onTap: (int index) => setState(() {
                //currentIndex = index;
              }),
            ),
          ),
        );
      },
    );
  }
}
