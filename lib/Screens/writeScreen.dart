import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sih_project/controllers/writeScreenController.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class WriteScreen extends StatefulWidget {
  const WriteScreen({super.key});

  @override
  State<WriteScreen> createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WriteScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = Get.height;
    double screenWidth = Get.width;
    TextScaler textScale = MediaQuery.of(context).textScaler;
    return GetBuilder<WriteSceenController>(
        init: WriteSceenController(),
        builder: (WriteSceenController wcontroller) {
          return SafeArea(
              child: Scaffold(
            appBar: AppBar(
              title: Text(
                wcontroller.screenTitle,
                style: TextStyle(
                  fontFamily: "DMSansSemiBold",
                  fontSize: textScale.scale(18),
                  color: Color(0XFF000000),
                ),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth / 11),
              child: Column(
                children: [
                  SizedBox(
                    height: screenHeight / 22.86,
                  ),
                  SizedBox(
                    width: screenWidth / 1.20,
                    height: screenHeight / 3.53,
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/bgBoard.png',
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          top: screenHeight /
                              9.5, // Adjust the position as needed
                          left: screenWidth /
                              3.46, // Adjust the position as needed
                          child: Text(
                            wcontroller.inputText,
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
                  Center(
                    child: SizedBox(
                      height: screenHeight / 30.76,
                      width: screenWidth / 5.80,
                      child: Text(
                        "Letter: ${wcontroller.inputText}",
                        style: TextStyle(
                          fontFamily: "DMSansSemiBold",
                          fontSize: textScale.scale(20),
                          color: Color(0XFF47475D),
                          //backgroundColor: Colors.black.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight / 22.22,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Writing Pad',
                      style: TextStyle(
                        fontFamily: "DMSansSemiBold",
                        fontSize: textScale.scale(18),
                        color: Colors.black,
                        //backgroundColor: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight / 27.58,
                  ),
                  Container(
                    height: screenHeight / 3.46,
                    width: screenWidth / 1.15,
                    child: SfSignaturePad(
                        key: wcontroller.wGlobalKey,
                        backgroundColor: Colors.white,
                        strokeColor: Colors.black,
                        minimumStrokeWidth: 2.0,
                        maximumStrokeWidth: 4.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: Color(0XFFCFCDCD), width: 5.0),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight / 21.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: wcontroller.redoPressed,
                        child: Container(
                          width: screenWidth / 4.44,
                          height: screenHeight / 25.80,
                          decoration: BoxDecoration(
                            color: Color(0XFFFFBEBE),
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(
                                color: Color(0XFFFF0000), width: 1.0),
                          ),
                          child: Center(
                              child: Text(
                            'Redo',
                            style: TextStyle(
                              fontFamily: "DMSansSemiBold",
                              fontSize: textScale.scale(15),
                              color: Colors.black,
                              //backgroundColor: Colors.black.withOpacity(0.5),
                            ),
                          )),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth / 24,
                      ),
                      InkWell(
                        onTap: wcontroller.submitPressed1,
                        child: Container(
                          width: screenWidth / 4.44,
                          height: screenHeight / 25.80,
                          decoration: BoxDecoration(
                            color: Color(0XFF9747FF),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Center(
                              child: Text(
                            'Submit',
                            style: TextStyle(
                              fontFamily: "DMSansSemiBold",
                              fontSize: textScale.scale(15),
                              color: Colors.white,
                              //backgroundColor: Colors.black.withOpacity(0.5),
                            ),
                          )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ));
        });
  }
}
