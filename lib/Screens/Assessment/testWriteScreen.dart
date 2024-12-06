import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'package:video_player/video_player.dart';

class Testwritescreen extends StatefulWidget {
  const Testwritescreen({super.key});

  @override
  State<Testwritescreen> createState() => _TestwritescreenState();
}

class _TestwritescreenState extends State<Testwritescreen> {
  late VideoPlayerController videoController;
  int currentStep = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     videoController = VideoPlayerController.asset('assets/videos/sample.mp4')
      ..initialize().then((_) {
        setState(() {}); // Refresh to show video
      });
    videoController.setLooping(true);
    videoController.play();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    videoController.dispose();
    super.dispose();
  }


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
          // question progress indicator
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
            height: 15,
          ),
          Center(
            child: Text(
              'What is this letter?',
              style: TextStyle(fontFamily: 'DMSansSemibold', fontSize: 18),
            ),
          ),
          SizedBox(
            height: 7,
          ),
          videoController.value.isInitialized
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    height: screenHeight / 2.64,
                    width: screenWidth / 1.13,
                    child: ClipRect(
                      child: OverflowBox(
                        alignment: Alignment.center,
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: SizedBox(
                            width: videoController.value.size.width,
                            height: videoController.value.size.height,
                            child: VideoPlayer(videoController),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : CircularProgressIndicator(),

          IconButton(
            onPressed: () {
              videoController.value.isPlaying
                  ? videoController.pause()
                  : videoController.play();
              //videoController.update();
            },
            icon: Icon(
              size: 30,
              videoController.value.isPlaying ? Icons.play_arrow : Icons.pause,
            ),
          ),

           Container(
            height: screenHeight / 3.46,
            width: screenWidth / 1.15,
            child: SfSignaturePad(
                key: wGlobalKey,
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
            height: 8,
          ),
           Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: redoPressed,
                child: Container(
                  width: screenWidth / 4.44,
                  height: screenHeight / 25.80,
                  decoration: BoxDecoration(
                    color: Color(0XFFFFBEBE),
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(color: Color(0XFFFF0000), width: 1.0),
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