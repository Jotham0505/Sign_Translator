import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sih_project/controllers/signScreenController.dart';
import 'package:video_player/video_player.dart';

class Numbersignscreen extends StatefulWidget {
  const Numbersignscreen({super.key});

  @override
  State<Numbersignscreen> createState() => _NumbersignscreenState();
}

class _NumbersignscreenState extends State<Numbersignscreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = Get.height;
    double screenWidth = Get.width;
    TextScaler textScale = MediaQuery.of(context).textScaler;
    return GetBuilder<SignScreenController>(
        init: SignScreenController(),
        builder: (SignScreenController scontroller) {
          return SafeArea(
              child: Scaffold(
            appBar: AppBar(
              title: Text(
                scontroller.screenTitle2,
                style: TextStyle(
                  fontFamily: "DMSansSemiBold",
                  fontSize: textScale.scale(18),
                  color: Color(0XFF000000),
                ),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth / 16.36),
              child: Column(
                children: [
                  SizedBox(
                    height: screenHeight / 2.32,
                    width: screenWidth / 1.13,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: OverflowBox(
                        alignment: Alignment.center,
                        child: FittedBox(
                          fit: BoxFit.cover, // Adjust the BoxFit as needed
                          child: SizedBox(
                            width: scontroller.videoController.value.size.width,
                            height:
                                scontroller.videoController.value.size.height,
                            child: VideoPlayer(scontroller.videoController),
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      scontroller.videoController.value.isPlaying
                          ? scontroller.videoController.pause()
                          : scontroller.videoController.play();
                      scontroller.update();
                    },
                    icon: Icon(
                      size: 35,
                      scontroller.videoController.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight / 57.14,
                  ),
                  Text(
                    scontroller.predictedValue.isEmpty
                        ? "Number: ${scontroller.inputText}"
                        : scontroller.predictedValue,
                    style: TextStyle(
                      fontFamily: "DMSansSemiBold",
                      fontSize: textScale.scale(36),
                      color: Color(0XFF47475D),
                      //backgroundColor: Colors.black.withOpacity(0.5),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight / 34.78,
                  ),
                  Text(
                    "Show the sign and upload here",
                    style: TextStyle(
                      fontFamily: "DMSansSemiBold",
                      fontSize: textScale.scale(15),
                      color: Color(0XFF47475D),
                      //backgroundColor: Colors.black.withOpacity(0.5),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight / 44.44,
                  ),
                  scontroller.isImgDone
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.file(
                                File(scontroller.image!.path),
                                height: screenHeight / 4.70,
                                width: screenWidth / 3,
                                fit: BoxFit.cover, // Adjust the fit as needed
                              ),
                            )
                          ],
                        )
                      : InkWell(
                          onTap: scontroller.capturePhoto,
                          child: Image.asset(
                            "assets/images/imgpick.png",
                            width: screenWidth / 1.13,
                            height: screenHeight / 6.95,
                          ),
                        )
                ],
              ),
            ),
            floatingActionButton: scontroller.isImgDone
                ? SizedBox(
                    width: 70,
                    child: FloatingActionButton(
                        backgroundColor: Color(0XFF9747FF),
                        onPressed: () async{
                          await scontroller.submitImage();
                        },
                        child: Text(
                          "Submit",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: textScale.scale(16),
                              fontWeight: FontWeight.w500),
                        )),
                  )
                : SizedBox(),
          ));
        });
  }
}