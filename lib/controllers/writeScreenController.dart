import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sih_project/Screens/numberSignScreen.dart';
import 'package:sih_project/controllers/homeScreenController.dart';
import 'package:sih_project/controllers/signScreenController.dart';
import 'package:sih_project/screens/signScreen.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class WriteSceenController extends GetxController {
  final GlobalKey<SfSignaturePadState> wGlobalKey = GlobalKey();
  String screenTitle = 'Alphabets';
  String inputText = "0";
  int index = 0;
  String screenTitle1 = 'Numbers';

  void updateIpText(int idx, String inputText) {
    this.inputText = inputText;
    index = idx;
  }

  //updateSignIpText(int idx, String inputText) {}

  void redoPressed() {
    wGlobalKey.currentState!.clear();
    update();
  }

  void submitPressed() {
    Get.to(() => Numbersignscreen());
}

void submitPressed1() {
    Get.to(() => SignScreen());
}
}