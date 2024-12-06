import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class Testsignscreen extends StatefulWidget {
  const Testsignscreen({super.key});

  @override
  State<Testsignscreen> createState() => _TestsignscreenState();
}

class _TestsignscreenState extends State<Testsignscreen> {
  int currentStep = 1;
  @override
  Widget build(BuildContext context) {
    double screenHeight = Get.height;
    double screenWidth = Get.width;
    TextScaler textScale = MediaQuery.of(context).textScaler;
    double progressPercent = (currentStep)/5;
    final GlobalKey<SfSignaturePadState> wGlobalKey = GlobalKey();
    void redoPressed() {
      wGlobalKey.currentState!.clear();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Test 1',style: TextStyle(fontFamily: 'DMSansSemibold',fontSize: 18),),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: LinearPercentIndicator(
              lineHeight: 10.0,
              percent: progressPercent,
              backgroundColor: Colors.grey.shade300,
              progressColor: Colors.green,
              barRadius: Radius.circular(5),
            ),
          ),
          SizedBox(
            height: 27,
          ),
          Center(
            child: Text(
              'What is this letter?',
              style: TextStyle(fontFamily: 'DMSansSemibold', fontSize: textScale.scale(18)),
            ),
          ),
           SizedBox(
            height: 15,
          ),
          SizedBox(
            width: screenWidth / 1.24,
            height: screenHeight / 3.53,
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/bgBoard.png',
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: screenHeight / 9.5, // Adjust the position as needed
                  left: screenWidth / 3.46, // Adjust the position as needed
                  child: Text(
                    //wcontroller.inputText,
                    '1',
                    style: TextStyle(
                      fontFamily: "DMSansBold",
                      fontSize: textScale.scale(50),
                      color: Colors.white,
                      //backgroundColor: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 71,
          ),
          Center(
            child: Text(
              'Show the sign and upload here',
              style: TextStyle(fontFamily: 'DMSansSemibold', fontSize: textScale.scale(15)),
            ),
          ),
          SizedBox(
            height: 36,
          ),
          InkWell(
            onTap: () {},
            child: Image.asset(
              "assets/images/imgpick.png",
              width: screenWidth / 1.13,
              height: screenHeight / 6.95,
            ),
          ),
          SizedBox(height: 88,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              
              SizedBox(
                width: screenWidth / 24,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: screenWidth / 4.44,
                  height: screenHeight / 25.80,
                  decoration: BoxDecoration(
                    color: Color(0XFF9747FF),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Center(
                      child: Text(
                    'Next',
                    style: TextStyle(
                      fontFamily: "DMSansSemiBold",
                      fontSize: textScale.scale(15),
                      color: Colors.white,
                      //backgroundColor: Colors.black.withOpacity(0.5),
                    ),
                  )),
                ),
              ),
               SizedBox(
                width: screenWidth / 24,
              ),
            ],
          ),
        ],
      ),
    );
  }
}