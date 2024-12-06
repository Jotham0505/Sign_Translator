import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sih_project/Screens/Assessment/mainAssScreen.dart';

class Testcompletescreen extends StatelessWidget {
  const Testcompletescreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = Get.height;
    double screenWidth = Get.width;
    TextScaler textScale = MediaQuery.of(context).textScaler;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 54,
          ),
          SizedBox(
            child: Image.asset('assets/images/testimg.png',width: 300,),
            height: screenHeight/1.40,
            width: screenWidth,
          ),
          Container(
                    height: screenHeight/17,
                    width: screenWidth/3.2,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => Mainassscreen());
                      },
                      child: Text("Next",style: TextStyle(fontFamily: 'DMSansBlack',color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)
                        ),
                        elevation: 0,
                        backgroundColor: Color(0XFF9747FF)
                      )
                    ),
                  ),
        ],
      ),
    );
  }
}